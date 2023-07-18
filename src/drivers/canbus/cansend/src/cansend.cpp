#include <ros/ros.h>
#include "cansend.hpp"
#include <sstream>

MagneticReq *magnetic_req;
SteerControl *steer_control;

namespace ns_cansend {
// Constructor
Cansend::Cansend(ros::NodeHandle &nh) : nh_(nh) {

  magnetic_req=new MagneticReq();
  steer_control=new SteerControl();
  
  loop_number = 0;
  steer_send_times = para.test_steer_angle;
};

Cansend::~Cansend(){
  delete magnetic_req;
  delete steer_control;
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

void Cansend::runAlgorithm() {
  // ROS_WARN_STREAM("steer: "<<steer_send_times);
  if(para.send_mode == 0){
    // Test steer
    if(steer_send_times>0){//left +
      steer_send_times = steer_send_times - 1;
      steer_control->sendLeftReq();
      // ROS_INFO("left turn");
    }else{
      if (steer_send_times<0){//right - 
        steer_send_times = steer_send_times + 1;
        steer_control->sendRightReq();
        // ROS_INFO("right turn");
      }else{
        steer_control->setNullMsg();
        // no operation
      }
    }
    // Test drive
    double drive_cmd = clamp(para.test_motor_input,-1.0,1.0);
    drive_cmd = deadband(drive_cmd,para.motor_dead_input);
    int test_motor_rpm = drive_cmd * para.motor_max_rmp;
    motor_control->SetMotor1SpeedCon(test_motor_rpm);
    motor_control->SetMotor2SpeedCon(test_motor_rpm);

  }else{
    // Autonomous driving mode
    // steering
    double steer_cmd = clamp(ccs.cmd.steering_angle,-1.0,1.0);
    if (steer_cmd>para.steer_dead_input){
      std::cout << "turn left: " << steer_cmd;
      steer_control->sendLeftReq();
    }else{
      if (steer_cmd<-para.steer_dead_input){
        std::cout << "turn right: " << steer_cmd;
        steer_control->sendRightReq();
      }
      else{
        steer_control->setNullMsg();
      }
    }
    // driving
    double drive_cmd = clamp(ccs.cmd.velocity,-1.0,1.0);
    drive_cmd = deadband(drive_cmd,para.motor_dead_input);
    int motor_rpm = drive_cmd * para.motor_max_rmp;
    motor_control->SetMotor1SpeedCon(motor_rpm);
    motor_control->SetMotor2SpeedCon(motor_rpm);
  }
}
}
