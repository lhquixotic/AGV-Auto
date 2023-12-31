#ifndef CONTROL_HPP
#define CONTROL_HPP


#include "common_msgs/SerialMsg.h"
#include "common_msgs/RemoteControl.h"
#include "common_msgs/MagneticSignal.h"
#include "common_msgs/ChassisState.h"

// #include "nav_msgs/Odometry.h"

// #include "common_msgs/ControlCmd.h"
#include "common_msgs/ControlCommandStamped.h"

#include "std_msgs/String.h"
#include "pid.hpp"
#include <vector>

namespace ns_control {

struct Para{
  bool longitudinal_control_switch;
  bool lateral_control_switch;
  int  longitudinal_mode; // 1:constant speed, 2: planned speed, 3: desired distance
  double desired_speed;
  double desired_distance;
  double max_steer_angle;
  int max_magnetic_missing_time;
};

class Control {

 public:
  // Constructor
  Control(ros::NodeHandle &nh);

  // Getters
  common_msgs::ControlCommandStamped getControlCommand();

  // Setters
  void setRemoteControl(const common_msgs::RemoteControl &msg);
  void setRfidSignal(const common_msgs::SerialMsg &msg);
  void setMagneticSignal(const common_msgs::MagneticSignal &msg);
  void setChassisState(const common_msgs::ChassisState &msg);

  void setMagnetPidParameters(const Pid_para &msg);
  void setControlParameters(const Para &msg);


  // signal flags
  bool remoteControlFlag;
  bool rfidSignalFlag;
  bool magneticSignalFlag;

  // Methods
  void runAlgorithm();
  void initializeController();
  void latControlUpdate();
  void longControlUpdate();

 private:

  ros::NodeHandle &nh_;

  common_msgs::ControlCommand control_cmd;
  common_msgs::ControlCommandStamped ccs;

  common_msgs::RemoteControl remote_control;
  common_msgs::SerialMsg rfid_signal;
  int rfid_stop;
  common_msgs::MagneticSignal magnetic_signal;
  common_msgs::ChassisState chassis_state;

  // for start-stop state machine
  bool auto_control_enable;
  void updateStateMachine();
  void updateRfid();

  bool is_initialized;
  int kept_remote_mode;
  int kept_rfid_stop;
  int kept_rfid_value;

  PID magnet_pid_controller;
  Pid_para magnet_error_pid_para;
  // Pid_para angle_error_pid_para;
  Para control_para;

  // double ini_wheel_angle;
  // double cur_wheel_angle; 

  int loop_number;

  // for magnetic memory
  // std::vector<int> magnetic_buffer = std::vector<int>(5,8);
  int kept_magnetic_loc;
  int magnetic_missing_time;
  // methods
};
}

#endif //CONTROL_HPP
