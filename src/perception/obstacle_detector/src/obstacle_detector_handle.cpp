#include <ros/ros.h>
#include "obstacle_detector_handle.hpp"
#include "register.h"
#include <chrono>

namespace ns_obstacle_detector {

// Constructor
ObstacleDetectorHandle::ObstacleDetectorHandle(ros::NodeHandle &nodeHandle) :
    nodeHandle_(nodeHandle),
    obstacle_detector_(nodeHandle) {
  ROS_INFO("Constructing Handle");
  loadParameters();
  obstacle_detector_.setParameters(para_);
  subscribeToTopics();
  publishToTopics();
}

// Getters
int ObstacleDetectorHandle::getNodeRate() const { return node_rate_; }

// Methods
void ObstacleDetectorHandle::loadParameters() {
  ROS_INFO("loading handle parameters");
  if (!nodeHandle_.param<std::string>("vision_detection_topic_name",
                                      vision_detection_topic_name_,
                                      "/perception/vision_detection")) {
    ROS_WARN_STREAM(
        "Did not load vision_detection_topic_name. Standard value is: " << vision_detection_topic_name_);
  }
  if (!nodeHandle_.param<std::string>("radar_detection_topic_name",
                                      radar_detection_topic_name_,
                                      "/perception/radar_detection")) {
    ROS_WARN_STREAM(
        "Did not load radar_detection_topic_name. Standard value is: " << radar_detection_topic_name_);
  }
  if (!nodeHandle_.param<std::string>("obstacle_distance_topic_name",
                                      obstacle_distance_topic_name_,
                                      "/perception/obstacle_distance")) {
    ROS_WARN_STREAM("Did not load obstacle_distance_topic_name. Standard value is: " << obstacle_distance_topic_name_);
  }
  if (!nodeHandle_.param("node_rate", node_rate_, 1)) {
    ROS_WARN_STREAM("Did not load node_rate. Standard value is: " << node_rate_);
  }
  // Parameters
  nodeHandle_.param<bool>("enable_visual_detection",para_.enable_visual_detection,false);
  nodeHandle_.param<bool>("enable_radar_detection",para_.enable_radar_detection,false);
  //nodeHandle_.param("config_name",variable_name,value);
}

void ObstacleDetectorHandle::subscribeToTopics() {
  ROS_INFO("subscribe to topics");
  visionConeDetectionsSubscriber_ =
      // nodeHandle_.subscribe(vision_detection_topic_name_, 1, &ObstacleDetectorHandle::visionDetectionCallback, this);
      nodeHandle_.subscribe(radar_detection_topic_name_, 1, &ObstacleDetectorHandle::radarDetectionCallback, this);
}//FIXME: change topic name you want to subscribe.

void ObstacleDetectorHandle::publishToTopics() {
  ROS_INFO("publish to topics");
  obstacleDistancePublisher_ = nodeHandle_.advertise<common_msgs::ObstacleDistance>(obstacle_distance_topic_name_, 1);
}

void ObstacleDetectorHandle::run() {
  obstacle_detector_.runAlgorithm();
  sendMsg();
}

void ObstacleDetectorHandle::sendMsg() {
  obstacleDistancePublisher_.publish(obstacle_detector_.getObstacleDistance());
}

void ObstacleDetectorHandle::radarDetectionCallback(const common_msgs::RadarSignal &msg) {
  obstacle_detector_.setRadarDetection(msg);
}
}