#ifndef CANSEND_HPP
#define CANSEND_HPP

#include "std_msgs/String.h"
#include "can_msgs/Frame.h"
// #include "common_msgs/ChassisControl.h"
#include "common_msgs/ControlCommandStamped.h"
#include "common_msgs/ChassisState.h"
#include "pid.hpp"
#include "calculate.hpp"

#include "MagneticReq.h"
#include "SteerControl.h"
#include "MotorControl.h"
#include "RadarReq.h"
#include "RightRadarReq.h"


#include "utils.hpp"
#include <fstream>


extern SteerControl *steer_control;
extern MagneticReq *magnetic_req;
extern MotorControl *motor_control;
extern RadarReq *radar_req;
extern RightRadarReq *right_radar_req;


namespace ns_cansend {

struct Para{
  int send_mode;
  int test_steer_angle;
  double test_motor_input;
  double motor_max_rpm;
  double motor_dead_input;
  double steer_max_angle;
  double steer_dead_input;
  double motor_manual_rpm;
  double motor_auto_rpm;
};

class Cansend {

 public:
  // Constructor
  Cansend(ros::NodeHandle &nh);
  ~Cansend();

  // Getters
  can_msgs::Frame getFrame(protocol *frame);

  // Setters
  // void setChassisControl(common_msgs::ChassisControl msg);
  void setChassisControl(common_msgs::ControlCommandStamped msg);
  void setChassisState(common_msgs::ChassisState msg);
  void setParameters(const Para &msg);
  void setAnglePidParameters(const Pid_para &msg);

  void runAlgorithm();

 private:

  ros::NodeHandle &nh_;

  // common_msgs::ChassisControl chassis_control_cmd;
  common_msgs::ControlCommandStamped ccs;
  common_msgs::ChassisState chassis_state;
  
  void sendSteerReq(double steer_cmd,int device_id);
  void sendSteerInfo(double des_steer_l, double des_steer_r);

  void manualControl(double desired_angle);
  void automaticControl(double desired_angle);
  void standStillControl();

  Para para;
  Pid_para angle_error_pid_para;
  
  int loop_number;
  int steer_send_times;

  // memorize mode
  int kept_remote_mode;

  PID angle_pid_controller;

  VehicleDynamicCal veh_dyn_cal;

  // steer wheel angle variable
  // double ini_left_angle;
  // double cur_left_angle;
  // double ini_right_angle;
  // double cur_right_angle; 

  // desired control value    
  int desired_motor_rpm_l;
  int desired_motor_rpm_r;

  // manual switch
  // int manual_switch;

};
}

#endif //CANSEND_HPP
