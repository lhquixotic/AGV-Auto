#include <ros/ros.h>
#include "cansend.hpp"
#include <sstream>

MagneticReq *magnetic_req;
SteerControl *steer_control;
MotorControl *motor_control;

namespace ns_cansend {
// Constructor
Cansend::Cansend(ros::NodeHandle &nh) : nh_(nh) ,
                                          angle_pid_controller(1.0,0.0,0.0){

  magnetic_req=new MagneticReq();
  steer_control=new SteerControl();
  motor_control=new MotorControl();
  
  loop_number = 0;
  steer_send_times = para.test_steer_angle;
  ini_left_angle = 0;
  cur_left_angle = 0;
  ini_right_angle = 0;
  cur_right_angle = 0;
  kept_remote_mode = 1;
};

Cansend::~Cansend(){
  delete magnetic_req;
  delete steer_control;
  delete motor_control;
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

void Cansend::runAlgorithm() {
  // ROS_WARN_STREAM("steer: "<<steer_send_times);
  if(para.send_mode == 0){
    // Test steer
    if(steer_send_times>0){//left +
      steer_send_times = steer_send_times - 1;
      steer_control->sendLeftReq(loop_number%2);
      // ROS_INFO("left turn");
    }else{
      if (steer_send_times<0){//right - 
        steer_send_times = steer_send_times + 1;
        steer_control->sendRightReq(loop_number%2);
        // ROS_INFO("right turn");
      }else{
        steer_control->setNullMsg();
        // no operation
      }
    }
    // Test drive
    double drive_cmd = clamp(para.test_motor_input,-1.0,1.0);
    drive_cmd = deadband(drive_cmd,para.motor_dead_input);
    int test_motor_rpm = drive_cmd * para.motor_max_rpm;
    motor_control->SetMotor1SpeedCon(test_motor_rpm); // right, + forward
    motor_control->SetMotor2SpeedCon(-test_motor_rpm); // left, - foward

  }else{
    // Autonomous driving mode
    // steering
    double desired_angle = ccs.cmd.steering_angle;
    int remote_mode = ccs.cmd.control_mode;
    int desired_motor_rpm_l;
    int desired_motor_rpm_r;

    if (remote_mode == 1){ // manual control, need not to read angle. 
      desired_angle = clamp(deadband(desired_angle,para.steer_dead_input),-1.0,1.0);
    // left and right once each time
      // sendSteerReq(steer_cmd,loop_number%2);

      // int loop_flag = loop_number % 4;
      // switch (loop_flag)
      // {
      // case 0: 
      //   sendSteerReq(desired_angle,1);
      //   break;
      // case 1:
      //   sendSteerReq(desired_angle,0);
      //   break;
      // case 2: 
      //   steer_control->sendReadReq(false,1);
      //   break;

      // case 3:
      //   steer_control->sendReadReq(true,1);
      //   break;
      
      // default:
      //   break;
      // }

      // send 6 frame 
      int loop_flag = loop_number % 6;
      switch (loop_flag)
      {
      case 0: 
        sendSteerReq(desired_angle,1);
        break;

      case 1:
        sendSteerReq(desired_angle,2);
        break;

      case 2: 
        steer_control->sendReadReq(false,1);
        break;

      case 3:
        steer_control->sendReadReq(true,1);
        break;
      
      case 4: 
        steer_control->sendReadReq(false,2);
        break;

      case 5: 
        steer_control->sendReadReq(true,2);
        break;

      default:
        break;
      }

      double desired_speed = clamp(ccs.cmd.linear_velocity,-1.0,1.0);
      desired_speed = deadband(desired_speed,para.motor_dead_input);

      // int motor_rpm = desired_speed * para.motor_max_rpm;
      int motor_rpm = desired_speed * para.motor_manual_rpm;
      desired_motor_rpm_l = motor_rpm;
      desired_motor_rpm_r = motor_rpm;

      // if (steer_cmd>0) steer_control->sendLeftReq(loop_number%2);
      // else if (steer_cmd<0) steer_control->sendRightReq(loop_number%2);
      // else steer_control->setNullMsg();
    }else{ // automatic control, need to read angle
      if (remote_mode == 2){
          /*  Steering for automatic mode  */
          // Desired steering angle
          double desired_angle_l = desired_angle;
          double desired_angle_r = desired_angle;
          desired_angle_l = clamp(veh_dyn_cal.calculate_angle(desired_angle,true),-para.steer_max_angle,para.steer_max_angle);
          desired_angle_r = clamp(veh_dyn_cal.calculate_angle(desired_angle,false),-para.steer_max_angle,para.steer_max_angle);

          // Current steering angle
          if (kept_remote_mode == 1){// initialization when into mode 2
            ini_left_angle = chassis_state.real_steer_angle_left;
            ini_right_angle = chassis_state.real_steer_angle_right;
          }
          cur_left_angle = chassis_state.real_steer_angle_left - ini_left_angle;
          cur_right_angle = chassis_state.real_steer_angle_right - ini_right_angle;

          // PID steering tracking
          double steer_cmd_l = -angle_pid_controller.outputSignal(desired_angle_l,cur_left_angle);
          double steer_cmd_r = -angle_pid_controller.outputSignal(desired_angle_r,cur_right_angle);
          steer_cmd_l = deadband(steer_cmd_l,para.steer_dead_input);
          steer_cmd_r = deadband(steer_cmd_r,para.steer_dead_input);

          if (loop_number %25 == 0){ROS_INFO("[Cansend] des_left: %f, cur_left: %f, cmd_left: %f, des_right: %f, cur_right: %f, cmd_right: %f",desired_angle_l,cur_left_angle,steer_cmd_l,desired_angle_r,cur_right_angle,steer_cmd_r);}
          
          // Loop sned 
          int loop_flag = loop_number % 6;
          switch (loop_flag)
          {
          case 0: 
            sendSteerReq(steer_cmd_l,1);
            break;

          case 1:
            sendSteerReq(steer_cmd_r,2);
            break;

          case 2: 
            steer_control->sendReadReq(false,1);
            break;

          case 3:
            steer_control->sendReadReq(true,1);
            break;
          
          case 4: 
            steer_control->sendReadReq(false,2);
            break;

          case 5: 
            steer_control->sendReadReq(true,2);
            break;

          default:
            break;
          }

          /* driving for automatic mode */
          // Get desired speed
          double desired_speed = clamp(ccs.cmd.linear_velocity,-1.0,30.0);
          desired_speed = deadband(desired_speed,3);

          desired_motor_rpm_l = veh_dyn_cal.calculate_whlspd(desired_speed,desired_angle,true);
          desired_motor_rpm_r = veh_dyn_cal.calculate_whlspd(desired_speed,desired_angle,false);
          ROS_INFO("desired angle: %f, R: %f, l: %f, r: %f",desired_angle,veh_dyn_cal.R,desired_motor_rpm_l,desired_motor_rpm_r);
      }else{
          steer_control->setNullMsg();
          desired_motor_rpm_l = 0;
          desired_motor_rpm_r = 0;
      };
       
    }
    desired_motor_rpm_l = clamp(desired_motor_rpm_l,-para.motor_max_rpm,para.motor_max_rpm);
    desired_motor_rpm_r = clamp(desired_motor_rpm_r,-para.motor_max_rpm,para.motor_max_rpm);
    
    if (loop_number %25 == 0){
      ROS_INFO("[Cansend Motor] left: %f, right: %f",desired_motor_rpm_l, desired_motor_rpm_r);
    }
    motor_control->SetMotor1SpeedCon(desired_motor_rpm_l);
    motor_control->SetMotor2SpeedCon(-desired_motor_rpm_r);
    kept_remote_mode = remote_mode;
  }
  loop_number += 1;
}
}
