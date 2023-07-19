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
      ROS_INFO("[Remote] mode: %d",remote_signals.data[9]);
      int raw_mode = remote_signals.data[9] / 2;
      // delete oldest data
      buffer.erase(buffer.begin());
      // add current data
      buffer.push_back(raw_mode);
      // get max data in buffer as mode
      int mode = *std::max_element(buffer.begin(),buffer.end());

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

      float factor = 1.0 / (0x069f-0x0400);

      remote_control.mode = mode;
      remote_control.accel = -factor * r_up;
      remote_control.steer = -factor * l_lf;

      // ROS_INFO_STREAM("[Remote] Control mode: " << mode << ", go forward value: " << std::fixed << std::setprecision(2) << - factor * r_up << ", turn left steer: " << -factor * l_lf);
      
      // for(int i=0;i<signal_len;i++){
        
      //   // std::cout << std::hex << (remote_signals.data[i] && 0xff) << " ";
      //   // ROS_INFO_STREAM(std::hex << (remote_signals.data[i] && 0xff) << " ");
      // }
      // std::cout << std::endl;
     }
   }//FIXME:add code you want to execute.

  }
}
