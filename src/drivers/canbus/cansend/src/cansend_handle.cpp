#include <ros/ros.h>
#include "cansend_handle.hpp"
#include "register.h"
#include <chrono>

namespace ns_cansend {

// Constructor
CansendHandle::CansendHandle(ros::NodeHandle &nodeHandle) :
    nodeHandle_(nodeHandle),
    cansend_(nodeHandle) {
  ROS_INFO("Constructing Handle");
  loadParameters();
  cansend_.setAnglePidParameters(angle_error_pid_para_);
  cansend_.setParameters(para_);
  subscribeToTopics();
  publishToTopics();
  ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Info);
  loop_number = 0;
}

// Getters
int CansendHandle::getNodeRate() const { return node_rate_; }

// Methods
void CansendHandle::loadParameters() {
  ROS_INFO("loading handle parameters");
  if (!nodeHandle_.param<std::string>("chassis_control_topic_name",
                                      chassis_control_topic_name_,
                                      "/chassis/control_cmd")) {
    ROS_WARN_STREAM(
        "Did not load chassis_control_topic_name. Standard value is: " << chassis_control_topic_name_);
  }
  if (!nodeHandle_.param<std::string>("chassis_state_topic_name",
                                      chassis_state_topic_name_,
                                      "/chassis_state")) {
    ROS_WARN_STREAM(
        "Did not load chassis_state_topic_name. Standard value is: " << chassis_state_topic_name_);
  }
  if (!nodeHandle_.param<std::string>("cansend_topic_name",
                                      cansend_topic_name_,
                                      "/sent_messages")) {
    ROS_WARN_STREAM("Did not load cansend_topic_name. Standard value is: " << cansend_topic_name_);
  }
  if (!nodeHandle_.param<std::string>("cansend_can1_topic_name",
                                      cansend_can1_topic_name_,
                                      "/sent_messages_can1")) {
    ROS_WARN_STREAM("Did not load cansend_can1_topic_name. Standard value is: " << cansend_can1_topic_name_);
  }
  if (!nodeHandle_.param("node_rate", node_rate_, 1)) {
    ROS_WARN_STREAM("Did not load node_rate. Standard value is: " << node_rate_);
  }
  nodeHandle_.param<int>("cansend_para/send_mode",para_.send_mode,0);
  nodeHandle_.param<int>("cansend_para/test_steer_angle",para_.test_steer_angle,0);
  nodeHandle_.param<double>("cansend_para/test_motor_input",para_.test_motor_input,0);
  nodeHandle_.param<double>("cansend_para/motor_max_rpm",para_.motor_max_rpm,1000);
  nodeHandle_.param<double>("cansend_para/motor_manual_rpm",para_.motor_manual_rpm,1000);
  nodeHandle_.param<double>("cansend_para/motor_dead_input",para_.motor_dead_input,0.1);
  nodeHandle_.param<double>("cansend_para/steer_max_angle",para_.steer_max_angle,45);
  nodeHandle_.param<double>("cansend_para/steer_dead_input",para_.steer_dead_input,0.1);
  nodeHandle_.param<double>("cansend_para/motor_auto_rpm",para_.motor_auto_rpm,600);
  ROS_INFO_STREAM("[Cansend] Para: test_steer_angle" << para_.test_steer_angle);
  
  nodeHandle_.param<double>("angle_error_pid/kp", angle_error_pid_para_.kp, 1.0);
  nodeHandle_.param<double>("angle_error_pid/kd", angle_error_pid_para_.kd, 0.0);
  nodeHandle_.param<double>("angle_error_pid/ki", angle_error_pid_para_.ki, 0.0);
  ROS_INFO_STREAM("[angle pid] kp: " << angle_error_pid_para_.kp << ", ki: " << angle_error_pid_para_.ki << ", kd: " << angle_error_pid_para_.kd);

}

void CansendHandle::subscribeToTopics() {
  ROS_INFO("subscribe to topics");
  chassisControlSubscriber_ =
      nodeHandle_.subscribe(chassis_control_topic_name_, 1, &CansendHandle::chassisControlCallback, this);
  chassisStateSubscriber_ = 
      nodeHandle_.subscribe(chassis_state_topic_name_, 1, &CansendHandle::chassisStateCallback, this);
}

void CansendHandle::publishToTopics() {
  ROS_INFO("publish to topics");
  cansendStatePublisher_ = nodeHandle_.advertise<can_msgs::Frame>(cansend_topic_name_, 100);
  cansendCan1Publisher_ = nodeHandle_.advertise<can_msgs::Frame>(cansend_can1_topic_name_, 100);
}

void CansendHandle::run() {
  cansend_.runAlgorithm();
  sendMsg();
  loop_number ++;
}

void CansendHandle::sendMsg() {
  // cansendStatePublisher_.publish(cansend_.getFrame(magnetic_req));
  cansendStatePublisher_.publish(cansend_.getFrame(motor_control));
  cansendStatePublisher_.publish(cansend_.getFrame(steer_control));  
}

void CansendHandle::chassisControlCallback(const common_msgs::ControlCommandStamped &msg) {
  cansend_.setChassisControl(msg);
}

void CansendHandle::chassisStateCallback(const common_msgs::ChassisState &msg) {
  cansend_.setChassisState(msg);
}
}
