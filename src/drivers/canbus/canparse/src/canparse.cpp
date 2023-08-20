#include <ros/ros.h>
#include "canparse.hpp"
#include <sstream>
#include <bitset>

namespace ns_canparse {
// Constructor
Canparse::Canparse(ros::NodeHandle &nh) : nh_(nh) {
  kept_left_steer_recved = false;
  kept_right_steer_recved = false;
  loop_number = 0;
};

// Getters
common_msgs::MagneticSignal Canparse::getMagneticSignal(){return magnetic_signal;}
common_msgs::ChassisState Canparse::getChassisState(){return chassis_state;}
common_msgs::RadarSignal Canparse::getRadarSignal(){return radar_signal;}
common_msgs::RadarSignal Canparse::getRightRadarSignal(){return right_radar_signal;}


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
    // ROS_INFO("[CAN parse] Magnetic received.");
    break;

  case 0x04:
    magnetic.Update(f.data.c_array());
    // ROS_INFO("[CAN parse] Magnetic received.");
    break;

  case 0x002:// Steer
    steer.Update(f.data.c_array());
    break;
  
  case 0x0521:
    radar.Update(f.data.c_array());
    break;

  case 0x0522:
    right_radar.Update(f.data.c_array());
    break;

  default:
    break;
  }
}

void Canparse::runAlgorithm() {
  /****** Magnetic data ******/
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
  
  /****** Steer data ******/
  bool left_steer_data_recved = steer.LeftSteerDataRecved();
  bool right_steer_data_recved = steer.RightSteerDataRecved();
  if (left_steer_data_recved){
    chassis_state.real_steer_angle_left = steer.LeftSteerPosition();
    // ROS_INFO("[CanParse] Left steer angle received: %f", chassis_state.real_steer_angle_left);
    if(!kept_left_steer_recved){ROS_INFO("[CanParse] Left steer angle received: %f", chassis_state.real_steer_angle_right);kept_left_steer_recved=true;}
    
  }
  if (right_steer_data_recved){
    chassis_state.real_steer_angle_right = steer.RightSteerPosition();
    // ROS_INFO("[CanParse] Right steer angle received: %f", chassis_state.real_steer_angle_right);
    if(!kept_right_steer_recved){ROS_INFO("[CanParse] Right steer angle received: %f", chassis_state.real_steer_angle_right);kept_right_steer_recved=true;}
  }
  // ROS_INFO_STREAM();
  if(loop_number%25==0){
    if(left_steer_data_recved && right_steer_data_recved){
      ROS_INFO("[CanParse] right angle: %f, left angle: %f",chassis_state.real_steer_angle_right+127,chassis_state.real_steer_angle_left-0.8);
    }
  }

  /****** Radar data ******/ 
  // read data
  uint8_t radar_data_h = radar.RadarDataH();
  uint8_t radar_data_l = radar.RadarDataL();
  uint16_t radar_data = (radar_data_h << 8) | radar_data_l;

  radar_signal.header.frame_id = 'vehicle';
  radar_signal.distance = float(radar_data/1000.0);

  /****** Right radar data ******/ 
  // read data
  uint8_t right_radar_data_h = right_radar.RightRadarDataH();
  uint8_t right_radar_data_l = right_radar.RightRadarDataL();
  uint16_t right_radar_data = (right_radar_data_h << 8) | right_radar_data_l;

  right_radar_signal.header.frame_id = 'vehicle';
  right_radar_signal.distance = float(right_radar_data/1000.0);

  loop_number ++;
}
}
// Steer initial value: right -127, left 0.8;
