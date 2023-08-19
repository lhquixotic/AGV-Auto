#ifndef CONTROL_HANDLE_HPP
#define CONTROL_HANDLE_HPP

#include "control.hpp"

namespace ns_control {

class ControlHandle {

 public:
  // Constructor
  ControlHandle(ros::NodeHandle &nodeHandle);

  // Getters
  int getNodeRate() const;

  // Methods
  void loadParameters();
  void subscribeToTopics();
  void publishToTopics();
  void run();
  void sendMsg();
  // void sendVisualization();

 private:
  ros::NodeHandle nodeHandle_;
  ros::Subscriber remoteControlSubscriber_;
  ros::Subscriber rfidSignalSubscriber_;
  ros::Subscriber magneticSignalSubscriber_;
  ros::Subscriber chassisStateSubscriber_;
  ros::Subscriber laneDetectionSubscriber_;
  ros::Subscriber obstacleDistanceSubscriber_;

  ros::Publisher controlCommandPublisher_;

  void remoteControlCallback(const common_msgs::RemoteControl &msg);
  void rfidSignalCallback(const common_msgs::SerialMsg &msg);
  void magneticSignalCallback(const common_msgs::MagneticSignal &msg);
  void chassisStateCallback(const common_msgs::ChassisState &msg);
  void laneDetectionCallback(const simple_lane_detection::object &msg);
  vodi obstacleDistanceCallback(const common_msgs::ObstacleDistance &msg);

  std::string remote_control_topic_name_;
  std::string rfid_signal_topic_name_;
  std::string magnetic_signal_topic_name_;
  std::string chassis_state_topic_name_;
  std::string lane_detection_topic_name_;
  std::string obstacle_distance_topic_name_;

  std::string control_command_topic_name_;

  int node_rate_;
  int control_mode_;
  int stop_flag_;

  Para control_para_;
  Pid_para magnet_error_pid_para_;

  Control control_;

};
}

#endif //CONTROL_HANDLE_HPP
