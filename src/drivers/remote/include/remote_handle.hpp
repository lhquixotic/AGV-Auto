#ifndef REMOTE_HANDLE_HPP
#define REMOTE_HANDLE_HPP

#include "common_msgs/SerialMsg.h"
#include "remote.hpp"

namespace ns_remote {

class RemoteHandle {

 public:
  // Constructor
  RemoteHandle(ros::NodeHandle &nodeHandle);

  // Getters
  int getNodeRate() const;
  

  // Methods
  void loadParameters();
  void subscribeToTopics();
  void publishToTopics();
  void run();
  void sendMsg();

 private:
  ros::NodeHandle nodeHandle_;
  ros::Subscriber remoteSignalsSubscriber_;
  ros::Publisher remoteControlPublisher_;

  void remoteSignalsCallback(const common_msgs::SerialMsg &msgs);

  std::string remote_signals_topic_name_;
  std::string remote_control_topic_name_;

  int node_rate_;

  Remote remote_;

};
}

#endif //REMOTE_HANDLE_HPP
