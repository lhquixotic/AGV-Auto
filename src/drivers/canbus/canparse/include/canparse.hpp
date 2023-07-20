#ifndef CANPARSE_HPP
#define CANPARSE_HPP

#include "common_msgs/MagneticSignal.h"
#include "common_msgs/ChassisState.h"
#include "std_msgs/String.h"
#include <can_msgs/Frame.h>

#include "Magnetic.h"
#include "Steer.h"

namespace ns_canparse {

class Canparse {

 public:
  // Constructor
  Canparse(ros::NodeHandle &nh);
  Magnetic magnetic;
  Steer steer;

  // Getters
  common_msgs::ChassisState getChassisState();
  common_msgs::MagneticSignal getMagneticSignal();

  // Setters
  void Parse(can_msgs::Frame f);

  void runAlgorithm();

 private:

  ros::NodeHandle &nh_;

  common_msgs::ChassisState chassis_state;
  common_msgs::MagneticSignal magnetic_signal;

  bool kept_left_steer_recved;
  bool kept_right_steer_recved;

  int loop_number;

};
}

#endif //CANPARSE_HPP
