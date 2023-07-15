#include <ros/ros.h>
#include "remote_handle.hpp"
#include "register.h"
#include <chrono>

namespace ns_remote {

// Constructor
RemoteHandle::RemoteHandle(ros::NodeHandle &nodeHandle) :
    nodeHandle_(nodeHandle),
    remote_(nodeHandle) {
  ROS_INFO("Constructing Handle");
  loadParameters();
  subscribeToTopics();
  publishToTopics();
}

// Getters
int RemoteHandle::getNodeRate() const { return node_rate_; }

// Methods
void RemoteHandle::loadParameters() {
  ROS_INFO("loading handle parameters");
  if (!nodeHandle_.param<std::string>("remote_signal_topic_name",
                                      remote_signals_topic_name_,
                                      "/drivers/remote/signals")) {
    ROS_WARN_STREAM(
        "Did not load remote_signals_topic_name. Standard value is: " << remote_signals_topic_name_);
  }
  if (!nodeHandle_.param<std::string>("remote_control_topic_name",
                                      remote_control_topic_name_,
                                      "/drivers/remote/control")) {
    ROS_WARN_STREAM("Did not load remote_control_topic_name. Standard value is: " << remote_control_topic_name_);
  }
  if (!nodeHandle_.param("node_rate", node_rate_, 1)) {
    ROS_WARN_STREAM("Did not load node_rate. Standard value is: " << node_rate_);
  }
  //nodeHandle_.param("config_name",variable_name,value);
}

void RemoteHandle::subscribeToTopics() {
  ROS_INFO("subscribe to topics");
  remoteSignalsSubscriber_ =
      nodeHandle_.subscribe(remote_signals_topic_name_, 1, &RemoteHandle::remoteSignalsCallback, this);
}

void RemoteHandle::publishToTopics() {
  ROS_INFO("publish to topics");
  remoteControlPublisher_ = nodeHandle_.advertise<common_msgs::RemoteControl>(remote_control_topic_name_, 1);
}//FIXME: change topic name you want to advertise.

void RemoteHandle::run() {
  // std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
  remote_.runAlgorithm();
  // std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
  // double time_round = std::chrono::duration_cast<std::chrono::duration<double>>(t2 - t1).count();
  // std::cout << "time cost = " << time_round << ", frequency = " << 1 / time_round << std::endl;
  sendMsg();
}

void RemoteHandle::sendMsg() {
  remoteControlPublisher_.publish(remote_.getRemoteControl());
}//FIXME: change the msg name you want to publish.

void RemoteHandle::remoteSignalsCallback(const common_msgs::SerialMsg &msgs) {
  remote_.setRemoteSignals(msgs);
}//FIXME: change or add callback functions to receive msgs.
}