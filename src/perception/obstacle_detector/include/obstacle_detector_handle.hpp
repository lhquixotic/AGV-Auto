#ifndef OBSTACLE_DETECTOR_HANDLE_HPP
#define OBSTACLE_DETECTOR_HANDLE_HPP

#include "obstacle_detector.hpp"

namespace ns_obstacle_detector {

class ObstacleDetectorHandle {

 public:
  // Constructor
  ObstacleDetectorHandle(ros::NodeHandle &nodeHandle);

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
  ros::Subscriber visionDetectionSubscriber_;
  ros::Subscriber radarDetectionSubscriber_;
  ros::Subscriber rightRadarDetectionSubscriber_;
  ros::Publisher obstacleDistancePublisher_;

  // void visionDetectionsCallback(const fsd_common_msgs::ConeDetections &cones);// TODO: visual detection msg
  void radarDetectionCallback(const common_msgs::RadarSignal &msg);
  void rightRadarDetectionCallback(const common_msgs::RadarSignal &msg);


  std::string vision_detection_topic_name_; 
  std::string radar_detection_topic_name_;
  std::string right_radar_detection_topic_name_;

  std::string obstacle_distance_topic_name_;

  int node_rate_;

  ObstacleDetector obstacle_detector_;
  Para para_;

};
}

#endif //OBSTACLE_DETECTOR_HANDLE_HPP
