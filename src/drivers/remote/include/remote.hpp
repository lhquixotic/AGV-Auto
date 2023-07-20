#ifndef REMOTE_HPP
#define REMOTE_HPP

#include "common_msgs/RemoteControl.h"
#include "common_msgs/SerialMsg.h"
#include <vector>
#include <algorithm>

namespace ns_remote {

class Remote {

 public:
  // Constructor
  Remote(ros::NodeHandle &nh);

  // Getters
  common_msgs::RemoteControl getRemoteControl();

  // Setters
  void setRemoteSignals(common_msgs::SerialMsg msgs); 

  void runAlgorithm(); 

 private:

  ros::NodeHandle &nh_;

  common_msgs::RemoteControl remote_control;
  common_msgs::SerialMsg remote_signals;

  std::vector<int> buffer = std::vector<int> (5,0);
  int buffer_size;
  int loop_number;

  std::vector<float> steer_buffer = std::vector<float> (5,0);
  std::vector<float> drive_buffer = std::vector<float> (5,0);
};
}

#endif //REMOTE_HPP
