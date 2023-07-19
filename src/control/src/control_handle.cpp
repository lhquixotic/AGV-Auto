#include <ros/ros.h>
#include "control_handle.hpp"
#include "register.h"
#include <chrono>

namespace ns_control {

// Constructor
ControlHandle::ControlHandle(ros::NodeHandle &nodeHandle) :
    nodeHandle_(nodeHandle),
    control_(nodeHandle) {
  ROS_INFO("Constructing Handle");
  loadParameters();
  control_.setPidParameters(pid_para_);
  control_.setControlParameters(control_para_);
  // control_mode_ = control_para_.longitudinal_mode; 
  // 1: constant speed 2: planned sped, 3: desired distance
  subscribeToTopics();
  publishToTopics();
}

// Getters
int ControlHandle::getNodeRate() const { return node_rate_; }

// Methods
void ControlHandle::loadParameters() {
  ROS_INFO("loading handle parameters");
  if(!nodeHandle_.param<std::string>("remote_control_topic_name",
                                    remote_control_topic_name_,
                                    "/drivers/remote/control")){
    ROS_WARN_STREAM(
        "Did not load remote_control_topic_name. Standard value is: " << remote_control_topic_name_);
                                    }
  if (!nodeHandle_.param<std::string>("rfid_signal_topic_name",
                                      rfid_signal_topic_name_,
                                      "/drivers/rfid")) {
    ROS_WARN_STREAM(
        "Did not load rfid_signal_topic_name. Standard value is: " << rfid_signal_topic_name_);
  }
  if (!nodeHandle_.param<std::string>("magnetic_signal_topic_name",
                                      magnetic_signal_topic_name_,
                                      "/perception/magnetic")) {
    ROS_WARN_STREAM(
        "Did not load magnetic_signal_topic_name. Standard value is: " << magnetic_signal_topic_name_);
  }
  if (!nodeHandle_.param<std::string>("chassis_state_topic_name",
                                      chassis_state_topic_name_,
                                      "/chassis_state")) {
    ROS_WARN_STREAM(
        "Did not load chassis_state_topic_name. Standard value is: " << chassis_state_topic_name_);
  }
  if (!nodeHandle_.param<std::string>("control_command_topic_name",
                                      control_command_topic_name_,
                                      "/control_cmd")) {
    ROS_WARN_STREAM("Did not load control_command_topic_name. Standard value is: " << control_command_topic_name_);
  }
  if (!nodeHandle_.param("node_rate", node_rate_, 1)) {
    ROS_WARN_STREAM("Did not load node_rate. Standard value is: " << node_rate_);
  }
  // Control Parameters 
  nodeHandle_.param<bool>("control_switch/longitudinal",control_para_.longitudinal_control_switch,false);
  nodeHandle_.param<bool>("control_switch/lateral",control_para_.lateral_control_switch,false);
  nodeHandle_.param<int>("longitudinal_mode",control_para_.longitudinal_mode,1);
  nodeHandle_.param<double>("desired_speed",control_para_.desired_speed,5.0);
  nodeHandle_.param<double>("desired_distance",control_para_.desired_distance,5.0);
  ROS_INFO_STREAM("Longitudinal control enable: "<<control_para_.longitudinal_control_switch
                  << "; Lateral control enable: "<<control_para_.lateral_control_switch);
              
  // PID parameters
  nodeHandle_.param<double>("pid/kp", pid_para_.kp, 1.0);
  nodeHandle_.param<double>("pid/kd", pid_para_.kd, 0.0);
  nodeHandle_.param<double>("pid/ki", pid_para_.ki, 0.0);
  ROS_INFO_STREAM("kp: " << pid_para_.kp << ", ki: " << pid_para_.ki << ", kd: " << pid_para_.kd);
}

void ControlHandle::subscribeToTopics() {
  ROS_INFO("subscribe to topics");
  remoteControlSubscriber_ = 
      nodeHandle_.subscribe(remote_control_topic_name_, 10, &ControlHandle::remoteControlCallback, this);
  rfidSignalSubscriber_ =
      nodeHandle_.subscribe(rfid_signal_topic_name_, 10, &ControlHandle::rfidSignalCallback, this);
  magneticSignalSubscriber_ =
      nodeHandle_.subscribe(magnetic_signal_topic_name_, 10, &ControlHandle::magneticSignalCallback, this);
  chassisStateSubscriber_ = 
      nodeHandle_.subscribe(chassis_state_topic_name_,10, &ControlHandle::chassisStateCallback, this);
}

void ControlHandle::publishToTopics() {
  ROS_INFO("publish to topics");
  controlCommandPublisher_ = nodeHandle_.advertise<autoware_msgs::ControlCommandStamped>(control_command_topic_name_, 1);
}  

void ControlHandle::run() {
  control_.runAlgorithm();
  sendMsg();
}

void ControlHandle::sendMsg() {
  autoware_msgs::ControlCommandStamped control_command = control_.getControlCommand();
  controlCommandPublisher_.publish(control_command);
}
// Callbacks
void ControlHandle::remoteControlCallback(const common_msgs::RemoteControl &msg){
  control_.setRemoteControl(msg);
  control_.remoteControlFlag = true; // Fatal
}

void ControlHandle::magneticSignalCallback(const common_msgs::MagneticSignal &msg) {
  control_.setMagneticSignal(msg);
  control_.magneticSignalFlag = true; // Warn
}

void ControlHandle::rfidSignalCallback(const common_msgs::SerialMsg &msg){
  control_.setRfidSignal(msg);
  control_.rfidSignalFlag = true; // Warn
}

void ControlHandle::chassisStateCallback(const common_msgs::ChassisState &msg){
  control_.setChassisState(msg);
}

}