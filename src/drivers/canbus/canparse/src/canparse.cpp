#include <ros/ros.h>
#include "canparse.hpp"
#include <sstream>
#include <bitset>

namespace ns_canparse {
// Constructor
Canparse::Canparse(ros::NodeHandle &nh) : nh_(nh) {

};

// Getters
common_msgs::MagneticSignal Canparse::getMagneticSignal(){return magnetic_signal;}
common_msgs::ChassisState Canparse::getChassisState(){return chassis_state;}

// Setters
void Canparse::Parse(can_msgs::Frame f) {
  // ROS_INFO("frame id: %X",f.id);
  switch (f.id)
  {
  case 0x650:
    // id_0x00000650.Update(f.data.c_array() );
    // ROS_INFO("650Message: uwbDis: %f ; uwbFW %f ; uwbSta %f ; uwbZT %f ;", 
    //     id_0x00000650.uwbDis(), id_0x00000650.uwbFW(), id_0x00000650.uwbSta(),id_0x00000650.uwbZT());
    break;

  case 0x042:
    magnetic.Update(f.data.c_array());
    ROS_INFO("[CAN parse] Magnetic received.");
    break;

  case 0x002:// Steer
    steer.Update(f.data.c_array());
    break;
  
  default:
    break;
  }
}

void Canparse::runAlgorithm() {
  // Magnetic data
  // read data
  uint8_t magnetic_data_h = magnetic.MagneticDataH();
  uint8_t magnetic_data_l = magnetic.MagneticDataL();
  // ROS_INFO("[Magnetic] data_h: %d, data_l: %d", magnetic_data_h, magnetic_data_l);
  uint16_t magnetic_data = (magnetic_data_h << 8) | magnetic_data_l;
  // uint16_t binary_data = magnetic_data;
  // std::bitset<16> binaryNumber(binary_data);
  // ROS_INFO_STREAM("[Magnetic] Origin data is " << std::hex << magnetic_data);
  int number_of_1 = 0;
  int sum_of_1 = 0;

  // serarch for position of 1
  for (int i=0;i<16;i++){
    uint16_t mask = 1 << i;
    if (magnetic_data & mask){
      number_of_1 += 1;
      sum_of_1 += i;
    }
  }
  // set message
  magnetic_signal.header.frame_id = 'vehicle';
  magnetic_signal.header.stamp = ros::Time::now();
  magnetic_signal.intensity = number_of_1;
  magnetic_signal.middle_loc = 8;
  if(number_of_1 == 0){
    magnetic_signal.current_loc = 99;
  }else{
    magnetic_signal.current_loc = sum_of_1/number_of_1;
  }
  
  // Steer data
  bool steer_data_recved = steer.SteerDataRecved();
  if (steer_data_recved){
    chassis_state.real_steer_angle = steer.SteerPosition();
    ROS_INFO_STREAM("[CanParse] Steer angle received: " << chassis_state.real_steer_angle);
  }
  // ROS_INFO_STREAM();
}
}
