#ifndef CANSEND_HANDLE_HPP
#define CANSEND_HANDLE_HPP

#include "cansend.hpp"

namespace ns_cansend {

class CansendHandle {

 public:
  // Constructor
  CansendHandle(ros::NodeHandle &nodeHandle);

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
  ros::Subscriber chassisControlSubscriber_;
  ros::Publisher cansendStatePublisher_;

  void chassisControlCallback(const autoware_msgs::ControlCommandStamped &msg);

  std::string chassis_control_topic_name_;
  std::string cansend_topic_name_;

  int node_rate_;

  Cansend cansend_;
  Para para_;

};
}

#endif //CANSEND_HANDLE_HPP
