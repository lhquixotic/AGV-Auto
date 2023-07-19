#include <ros/ros.h>
#include "cansend.hpp"
#include <sstream>

MagneticReq *magnetic_req;
SteerControl *steer_control;
MotorControl *motor_control;

namespace ns_cansend {
// Constructor
Cansend::Cansend(ros::NodeHandle &nh) : nh_(nh) {

  magnetic_req=new MagneticReq();
  steer_control=new SteerControl();
  motor_control=new MotorControl();
  
  loop_number = 0;
  steer_send_times = para.test_steer_angle;
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
void Cansend::setChassisControl(autoware_msgs::ControlCommandStamped msg) {
  ccs = msg;
}
void Cansend::setParameters(const Para &msg){
  para = msg;
}

void Cansend::sendSteerReq(double steer_cmd, int device_id){
  if (steer_cmd>0) steer_control->sendLeftReq(device_id);
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
    double steer_cmd = clamp(ccs.cmd.steering_angle,-1.0,1.0);
    steer_cmd = deadband(steer_cmd,para.steer_dead_input);
    int remote_mode = ccs.cmd.control_mode;

    if (remote_mode == 1){ // manual control, need not to read angle. 
    // left and right once each time
      sendSteerReq(steer_cmd,loop_number%2);
      // if (steer_cmd>0) steer_control->sendLeftReq(loop_number%2);
      // else if (steer_cmd<0) steer_control->sendRightReq(loop_number%2);
      // else steer_control->setNullMsg();
    }else{ // automatic control, need to read angle
      int loop_flag = loop_number % 4;
      switch (loop_flag)
      {
      case 0: 
        sendSteerReq(steer_cmd,1);
        break;
      case 1:
        sendSteerReq(steer_cmd,0);
        break;
      case 2: 
        steer_control->sendReadReq(false,1);
        break;

      case 3:
        steer_control->sendReadReq(true,1);
        break;
      
      default:
        break;
      }
    }

    // driving
    double drive_cmd = clamp(ccs.cmd.linear_velocity,-1.0,1.0);
    drive_cmd = deadband(drive_cmd,para.motor_dead_input);
    int motor_rpm = drive_cmd * para.motor_max_rpm;
    motor_control->SetMotor1SpeedCon(motor_rpm);
    motor_control->SetMotor2SpeedCon(-motor_rpm);
  }
  loop_number += 1;

}
}
