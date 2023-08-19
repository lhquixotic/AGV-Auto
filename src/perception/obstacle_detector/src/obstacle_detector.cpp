#include <ros/ros.h>
#include "obstacle_detector.hpp"
#include <sstream>

namespace ns_obstacle_detector {
// Constructor
ObstacleDetector::ObstacleDetector(ros::NodeHandle &nh) : nh_(nh) {

};

// Getters
common_msgs::ObstacleDistance ObstacleDetector::getObstacleDistance() {return obstacle_distance;}

// Setters
void ObstacleDetector::setradarDetection(common_msgs::RadarSignal msg) {
  radar_signal = msg;
}
void ObstacleDetector::setParameters(const Para &msg){
  para = msg;
}

void ObstacleDetector::runAlgorithm() {
  obstacle_distance.header = radar_signal.header;
  if (para.enable_radar_detection){
    obstacle_distance.distance = radar_signal.distance;
  }else{
    obstcle_distance.distance = 999;
  }
}

}
