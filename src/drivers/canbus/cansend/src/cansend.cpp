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

  }else{
    if (ccs.cmd.steering_angle>0.1){
      std::cout << "turn left: " << ccs.cmd.steering_angle;
      steer_control->sendLeftReq();
    }else{
      if (ccs.cmd.steering_angle<-0.1){
        std::cout << "turn right: " << ccs.cmd.steering_angle;
        steer_control->sendRightReq();
      }
      else{
        steer_control->setNullMsg();
      }
    }
    //autonomous driving mode
    // id_0x04EF8480->SetconDegCmd(chassis_control_cmd.steer_angle);
    // id_0x04EF8480->SetcomControlCmd(1);
    // id_0x04EF8480->SetconRtCmd(para.setup_steer_speed);

    // id_0x0C040B2A->SetconAccReq(0);
    // id_0x0C040B2A->SetconSta(loop_number);
    // int control_mode = 0;
    // int target_acc_pedal = 0;
    // int target_brk_pedal = 0;
    // if (chassis_control_cmd.acc_pedal_open_request > 0){
    //   control_mode = 1;
    //   target_brk_pedal = chassis_control_cmd.acc_pedal_open_request;
    // }else{
    //   if (chassis_control_cmd.brk_pedal_open_request > 0){
    //     control_mode = 2;
    //     target_acc_pedal = chassis_control_cmd.brk_pedal_open_request;
    //   }
    // }
    // id_0x0C040B2A->SetcontrolScheme(control_mode);
    // id_0x0C040B2A->SetAccPedOpenReq(target_acc_pedal);
    // id_0x0C040B2A->SetBrkPedOpenReq(target_brk_pedal);
  }

  if (loop_number >= 16){
    loop_number = 0;
  }  
  loop_number += 1;
}


}
