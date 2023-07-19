#ifndef CONTROL_HPP
#define CONTROL_HPP


#include "common_msgs/SerialMsg.h"
#include "common_msgs/RemoteControl.h"
#include "common_msgs/MagneticSignal.h"

// #include "nav_msgs/Odometry.h"

// #include "common_msgs/ControlCmd.h"
#include "autoware_msgs/ControlCommandStamped.h"

#include "std_msgs/String.h"
#include "pid.hpp"

namespace ns_control {

struct Para{
  bool longitudinal_control_switch;
  bool lateral_control_switch;
  int  longitudinal_mode; // 1:constant speed, 2: planned speed, 3: desired distance
  double desired_speed;
  double desired_distance;
};

class Control {

 public:
  // Constructor
  Control(ros::NodeHandle &nh);

  // Getters
  autoware_msgs::ControlCommandStamped getControlCommand();

  // Setters
  void setRemoteControl(const common_msgs::RemoteControl &msg);
  void setRfidSignal(const common_msgs::SerialMsg &msg);
  void setMagneticSignal(const common_msgs::MagneticSignal &msg);

  void setPidParameters(const Pid_para &msg);
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

  autoware_msgs::ControlCommand control_cmd;
  autoware_msgs::ControlCommandStamped ccs;

  common_msgs::RemoteControl remote_control;
  common_msgs::SerialMsg rfid_signal;
  int rfid_stop;
  common_msgs::MagneticSignal magnetic_signal;


  // for start-stop state machine
  bool auto_control_enable;
  void updateStateMachine();
  void updateRfid();

  bool is_initialized;
  int kept_remote_mode;
  int kept_rfid_stop;
  int kept_rfid_value;

  PID pid_controller;
  Pid_para pid_para;
  Para control_para;
  
  // methods
};
}

#endif //CONTROL_HPP
