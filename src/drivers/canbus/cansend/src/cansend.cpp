#include <ros/ros.h>
#include "cansend.hpp"
#include <sstream>

MagneticReq *magnetic_req;
RadarReq *radar_req;
SteerControl *steer_control;
MotorControl *motor_control;

namespace ns_cansend {
// Constructor
Cansend::Cansend(ros::NodeHandle &nh) : nh_(nh) ,
                                          angle_pid_controller(1.0,0.0,0.0){

  magnetic_req=new MagneticReq();
  radar_req=new RadarReq();
  steer_control=new SteerControl();
  motor_control=new MotorControl();
  
  loop_number = 0;
  steer_send_times = para.test_steer_angle;
  // ini_left_angle = 0;
  // cur_left_angle = 0;
  // ini_right_angle = 0;
  // cur_right_angle = 0;
  kept_remote_mode = 1;
  steer_control->sendBackZeroReq(1);
  steer_control->sendBackZeroReq(2);
  desired_motor_rpm_r = 0;
  desired_motor_rpm_l = 0;
  
  // std::ofstream dirStream("/sys/class/gpio/gpio392/value");
  // std::ifstream dirStream("/sys/devices/c2f0000.gpio/gpiochip1/gpio/gpio392/value");
  // dirStream.open("/sys/class/gpio/gpio392/value");

  // if (!dirStream){
  //   ROS_WARN("[Light] Unable to open GPIO392.");
  // }
  
};

Cansend::~Cansend(){
  delete magnetic_req;
  delete steer_control;
  delete motor_control;
  delete radar_req;
}

// Getters
can_msgs::Frame Cansend::getFrame(protocol *frame) {
  can_msgs::Frame sendframe;
  sendframe.id = frame->id();
  sendframe.dlc = frame->dlc();
  sendframe.is_extended = frame->is_extended();
  sendframe.is_rtr = frame->is_rtr();
  frame->Update(sendframe.data.c_array());  
  return sendframe;
}

// Setters
void Cansend::setChassisControl(common_msgs::ControlCommandStamped msg) {
  ccs = msg;
}
void Cansend::setChassisState(common_msgs::ChassisState msg){
  chassis_state = msg;
}
void Cansend::setParameters(const Para &msg){
  para = msg;
}

void Cansend::setAnglePidParameters(const Pid_para &msg){
    angle_error_pid_para = msg;
    angle_pid_controller.kp = angle_error_pid_para.kp;
    angle_pid_controller.ki = angle_error_pid_para.ki;
    angle_pid_controller.kd = angle_error_pid_para.kd;
  }

void Cansend::sendSteerReq(double steer_cmd, int device_id){
  if (steer_cmd>0) {steer_control->sendLeftReq(device_id);}
  else if (steer_cmd<0) steer_control->sendRightReq(device_id);
  else steer_control->setNullMsg();
}

void Cansend::sendSteerInfo(double des_steer_l, double des_steer_r){
  int32_t left_steer_value = -17000 + des_steer_l * 8664;
  uint16_t left_steer_angle_h = (left_steer_value & 0xffff0000) >> 16;
  uint16_t left_steer_angle_l = left_steer_value & 0x0000ffff; 

  int32_t right_steer_value = 26000 + des_steer_r * 8664;
  uint16_t right_steer_angle_h = (right_steer_value & 0xffff0000) >> 16;
  uint16_t right_steer_angle_l = right_steer_value & 0x0000ffff;

  // ROS_INFO_STREAM("right_value:" << std::hex << right_steer_value << ", left_value: " <<  left_steer_value);
  int loop_flag = loop_number % 6;
  switch (loop_flag){
    case 0: steer_control->setHDataSteerReq(1,left_steer_angle_h); break;
    case 1: steer_control->setLDataSteerReq(1,left_steer_angle_l); break;
    case 2: steer_control->setConductSteer(1); break;
    case 3: steer_control->setHDataSteerReq(2, right_steer_angle_h); break;
    case 4: steer_control->setLDataSteerReq(2, right_steer_angle_l); break;
    case 5: steer_control->setConductSteer(2); break;
    default: break;
  }
}

void Cansend::standStillControl(){
  // [Lock] Still control
  steer_control->setNullMsg();
  desired_motor_rpm_l = 0;
  desired_motor_rpm_r = 0;
}

void Cansend::manualControl(double desired_angle){
  // Steer control
  desired_angle = clamp(deadband(desired_angle,para.steer_dead_input),-1.0,1.0);
  desired_angle = desired_angle * para.steer_max_angle;

  double desired_angle_l = desired_angle;
  double desired_angle_r = desired_angle;
  desired_angle_l = clamp(veh_dyn_cal.calculate_angle(desired_angle,true),-para.steer_max_angle,para.steer_max_angle);
  desired_angle_r = clamp(veh_dyn_cal.calculate_angle(desired_angle,false),-para.steer_max_angle,para.steer_max_angle);
      
  sendSteerInfo(desired_angle_l,desired_angle_r);

  if (loop_number %25 == 0)
    {ROS_INFO("[Steer] desired: %f, des_left: %f, des_right: %f",desired_angle, desired_angle_l,desired_angle_r);}

  // Drive control
  double desired_speed_remote = clamp(ccs.cmd.linear_velocity,-1.0,1.0);
  desired_speed_remote = deadband(desired_speed_remote,para.motor_dead_input);

  // No calculation
  double desired_rpm = desired_speed_remote * para.motor_manual_rpm;
  desired_motor_rpm_l = veh_dyn_cal.calculate_whlspd(desired_rpm,desired_angle,true);
  desired_motor_rpm_r = veh_dyn_cal.calculate_whlspd(desired_rpm,desired_angle,false);

  desired_motor_rpm_l = int(desired_motor_rpm_l);
  desired_motor_rpm_r = int(desired_motor_rpm_r);

  if (loop_number %25 == 0)
    {ROS_INFO("[Motor] desired: %f, right motor: %d, left motor: %d",desired_rpm,desired_motor_rpm_r,desired_motor_rpm_l);}
}

void Cansend::automaticControl(double desired_angle){
  // [Automatic] automatic control
  /*  Steering for automatic mode  */
  // Desired steering angle
  double desired_angle_l = desired_angle;
  double desired_angle_r = desired_angle;
  desired_angle_l = clamp(veh_dyn_cal.calculate_angle(desired_angle,true),-para.steer_max_angle,para.steer_max_angle);
  desired_angle_r = clamp(veh_dyn_cal.calculate_angle(desired_angle,false),-para.steer_max_angle,para.steer_max_angle);
  
  sendSteerInfo(desired_angle_l,desired_angle_r);
  
  if (loop_number %25 == 0)
    {ROS_INFO("[Steer]desire: %f, des_left: %f, des_right: %f",desired_angle, desired_angle_l,desired_angle_r);}
  
  /* driving for automatic mode */
  double desired_rpm = para.motor_auto_rpm;
  desired_motor_rpm_l = int(veh_dyn_cal.calculate_whlspd(desired_rpm,desired_angle,true));
  desired_motor_rpm_r = int(veh_dyn_cal.calculate_whlspd(desired_rpm,desired_angle,false));

  if (ccs.cmd.linear_velocity == 0){
    desired_motor_rpm_l = 0;
    desired_motor_rpm_r = 0;
  }

  if (loop_number %25 == 0)
    {ROS_INFO("[Motor] right motor: %d, left motor: %d",desired_motor_rpm_r,desired_motor_rpm_l);}
}

void Cansend::runAlgorithm() {
  // ROS_WARN_STREAM("steer: "<<steer_send_times);
  if(para.send_mode == 0){
    // Test steer
    // calculate desired value
    double des_steer_l = para.test_steer_angle;
    double des_steer_r = para.test_steer_angle;
    sendSteerInfo(des_steer_l,des_steer_r);

    // Test drive
    double drive_cmd = clamp(para.test_motor_input,-1.0,1.0);
    drive_cmd = deadband(drive_cmd,para.motor_dead_input);
    int test_motor_rpm = drive_cmd * para.motor_max_rpm;
    motor_control->SetMotor1SpeedCon(test_motor_rpm); // right, + forward
    motor_control->SetMotor2SpeedCon(-test_motor_rpm); // left, - foward

  }else{
    // Autonomous driving mode
    double desired_angle = ccs.cmd.steering_angle;
    int remote_mode = ccs.cmd.control_mode;

    // Mode selection
    if (remote_mode == 3) standStillControl(); 
    else{
      if ((remote_mode == 1)) manualControl(desired_angle);
      else{
        if((remote_mode == 2)) automaticControl(desired_angle);
      }
    }

    // Motor control
    desired_motor_rpm_l = clamp(desired_motor_rpm_l,-para.motor_max_rpm,para.motor_max_rpm);
    desired_motor_rpm_r = clamp(desired_motor_rpm_r,-para.motor_max_rpm,para.motor_max_rpm);
    
    motor_control->SetMotor1SpeedCon(-desired_motor_rpm_l);
    motor_control->SetMotor2SpeedCon(desired_motor_rpm_r);
    kept_remote_mode = remote_mode;

    // Warning light control
    if(loop_number%50 == 0){
      std::ofstream dirStream("/sys/class/gpio/gpio392/value");
      int signal = 0;
      if (std::abs(desired_motor_rpm_l) > 100){signal = 1;}
      dirStream << signal;
    }
    
    // Inquiry rada state
    radar_req->Update();
  }
  loop_number += 1;
}
}
