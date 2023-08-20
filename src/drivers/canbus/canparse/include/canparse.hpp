#ifndef CANPARSE_HPP
#define CANPARSE_HPP

#include "common_msgs/MagneticSignal.h"
#include "common_msgs/ChassisState.h"
#include "common_msgs/RadarSignal.h"
#include "std_msgs/String.h"
#include <can_msgs/Frame.h>

#include "Magnetic.h"
#include "Radar.h"
#include "Steer.h"
#include "RightRadar.h"

namespace ns_canparse {

class Canparse {

 public:
  // Constructor
  Canparse(ros::NodeHandle &nh);
  Magnetic magnetic;
  Steer steer;
  Radar radar;
  RightRadar right_radar;

  // Getters
  common_msgs::ChassisState getChassisState();
  common_msgs::MagneticSignal getMagneticSignal();
  common_msgs::RadarSignal getRadarSignal();
  common_msgs::RadarSignal getRightRadarSignal();

  // Setters
  void Parse(can_msgs::Frame f);

  void runAlgorithm();

 private:

  ros::NodeHandle &nh_;

  common_msgs::ChassisState chassis_state;
  common_msgs::MagneticSignal magnetic_signal;
  common_msgs::RadarSignal radar_signal;
  common_msgs::RadarSignal right_radar_signal;


  bool kept_left_steer_recved;
  bool kept_right_steer_recved;

  int loop_number;

};
}

#endif //CANPARSE_HPP
