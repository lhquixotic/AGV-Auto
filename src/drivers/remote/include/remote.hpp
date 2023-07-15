#ifndef REMOTE_HPP
#define REMOTE_HPP

#include "common_msgs/RemoteControl.h"
#include "common_msgs/SerialMsg.h"
#include "std_msgs/String.h"

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
;
};
}

#endif //REMOTE_HPP
