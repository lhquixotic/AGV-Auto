#ifndef CANPARSE_HANDLE_HPP
#define CANPARSE_HANDLE_HPP

#include "canparse.hpp"

namespace ns_canparse {

class CanparseHandle {

 public:
  // Constructor
  CanparseHandle(ros::NodeHandle &nodeHandle);

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
  ros::Subscriber canbus_receive_Subscriber_;
  ros::Publisher magneticSignalPublisher_;

  void CanbusReceiveCallback(const can_msgs::Frame &f);

  std::string magnetic_signal_topic_name_;

  std::string canbus_receive_topic_name_;

  int node_rate_;

  Canparse canparse_;

};
}

#endif //CANPARSE_HANDLE_HPP
