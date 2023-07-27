#include <ros/ros.h>
#include "remote.hpp"
#include <sstream>

namespace ns_remote {
// Constructor
Remote::Remote(ros::NodeHandle &nh) : nh_(nh) {
  buffer_size = buffer.size();
};//FIXME:load config params.

// Getters
common_msgs::RemoteControl Remote::getRemoteControl() { return remote_control; }
//FIXME: get value from config files.

// Setters
void Remote::setRemoteSignals(common_msgs::SerialMsg msgs) {
  remote_signals = msgs;
}// FIXME:set value from subscriber.

void Remote::runAlgorithm() {
  // ROS_INFO_STREAM("Remote signal length is " << remote_signals.length);
  int signal_len = remote_signals.length;
  // uint8_t signal_data[35];
  
  if (signal_len == 35){
    uint8_t checksum = 0;
    for (int j=1;j<34;j++){
      checksum ^= remote_signals.data[j];
    }
    bool XOR_check = (checksum == remote_signals.data[34]);
    if ((XOR_check) && (remote_signals.data[0] == 0x0f)){
      ROS_DEBUG("[Remote] mode: %d",remote_signals.data[9]);
      int raw_mode = remote_signals.data[9] / 2;
      /*  filter mode data   */
      // delete oldest data
      buffer.erase(buffer.begin());
      // add current data
      buffer.push_back(raw_mode);
      // get max data in buffer as mode
      int mode = *std::max_element(buffer.begin(),buffer.end());
      if(remote_signals.data[33]!=0) mode=0;
      remote_control.mode = mode;

      int l_up_h = remote_signals.data[5]; // front most: 0x069f - 0x0400 - 0x0160
      int l_up_l = remote_signals.data[6];
      int l_lf_h = remote_signals.data[7]; // left most: 0x0158 - 0x03f8 - 0x0697
      int l_lf_l = remote_signals.data[8];
      int r_up_h = remote_signals.data[3]; // front most: 0x0160 - 0x0400 - 0x069f
      int r_up_l = remote_signals.data[4];
      int r_lf_h = remote_signals.data[1]; // left most: 0x0160 - 0x0400 - 0x069f
      int r_lf_l = remote_signals.data[2];

      int l_up = l_up_h * 255 + l_up_l - 0x0400;
      int l_lf = l_lf_h * 255 + l_lf_l - 0x0400;
      int r_up = r_up_h * 255 + r_up_l - 0x0400;
      int r_lf = r_lf_h * 255 + r_lf_l - 0x0400;

      /* Filter steer and drive data */
      float factor = 1.0 / (0x069f-0x0400);
      // float raw_accel = -factor

      // drive_buffer.erase(drive_buffer.begin());
      // drive_buffer.push_back(r_up);
      // int filtered_r_up = *std::min_element(drive_buffer.begin(),drive_buffer.end());
      // remote_control.accel = -factor * filtered_r_up;

      // steer_buffer.erase(steer_buffer.begin());
      // steer_buffer.push_back(l_lf);
      // int filtered_l_lf = *std::min_element(steer_buffer.begin(),steer_buffer.end());
      // remote_control.steer = -factor * filtered_l_lf;


      // No filter version

      remote_control.accel = -factor * r_up;
      remote_control.steer = -factor * l_lf;

      if (std::abs(remote_control.accel)>1.05) remote_control.accel = 0;
      if (std::abs(remote_control.steer)>1.05) remote_control.steer = 0;
      
     }
   }

  }
}
