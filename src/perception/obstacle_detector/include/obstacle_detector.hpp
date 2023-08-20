#ifndef OBSTACLE_DETECTOR_HPP
#define OBSTACLE_DETECTOR_HPP

#include "common_msgs/ObstacleDistance.h"
#include "std_msgs/String.h"
#include "common_msgs/RadarSignal.h"

namespace ns_obstacle_detector {
struct Para{
  bool enable_visual_detection;
  bool enable_radar_detection;
};
class ObstacleDetector {
  

 public:
  // Constructor
  ObstacleDetector(ros::NodeHandle &nh);

  // Getters
  // common_msgs::ConeDetections getConeDetections(); //FIXME: get value for send
  common_msgs::ObstacleDistance getObstacleDistance();
  
  // Setters
  // void setConeDetections(fsd_common_msgs::ConeDetections cones); //FIXME: set value from received msgs
  void setRadarDetection(common_msgs::RadarSignal msg);
  void setRightRadarDetection(common_msgs::RadarSignal msg);

  void setParameters(Para msg);

  void runAlgorithm(); 
 private:

  ros::NodeHandle &nh_;

  common_msgs::RadarSignal radar_signal;
  common_msgs::RadarSignal right_radar_signal;

  common_msgs::ObstacleDistance obstacle_distance;

  Para para;
};
}

#endif //OBSTACLE_DETECTOR_HPP
