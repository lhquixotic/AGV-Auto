#include <ros/ros.h>
#include "canparse.hpp"
#include <sstream>
namespace ns_canparse {
// Constructor
Canparse::Canparse(ros::NodeHandle &nh) : nh_(nh) {

};

// Getters
common_msgs::ChassisState Canparse::getChassisState(){return chassis_state;}

// Setters
void Canparse::Parse(can_msgs::Frame f) {
  ROS_INFO("frame id: %X",f.id);
  switch (f.id)
  {
  case 0x650:
    // id_0x00000650.Update(f.data.c_array() );
    // ROS_INFO("650Message: uwbDis: %f ; uwbFW %f ; uwbSta %f ; uwbZT %f ;", 
    //     id_0x00000650.uwbDis(), id_0x00000650.uwbFW(), id_0x00000650.uwbSta(),id_0x00000650.uwbZT());
    break;

  case 0x002:
    id_0x0000005A.Update(f.data.c_array());
    // ROS_INFO("5AMessage:flwPitchRt: %f ; flwYawRt: %f;",
    //     id_0x0000005A.flwPitchRt(),id_0x0000005A.flwYawRt());
    break;

  default:
    break;
  }
}

void Canparse::runAlgorithm() {
  chassis_state.header.frame_id = "base_link";
  chassis_state.header.stamp = ros::Time::now();
  //id_0x18F02501.UpdateflwSpd();
  chassis_state.vehicle_lon_acceleration = id_0x18F02501.flwAcc();
  chassis_state.real_acc_pedal = id_0x18F02502.flwPdlAcc();
  chassis_state.real_brake_pedal = id_0x18F02502.flwPedBrk();
  chassis_state.real_steer_angle = id_0x18FF4BD1.flwStrAgl();
}

}
