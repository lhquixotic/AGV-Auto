/*
    Formula Student Driverless Project (FSD-Project).
    Copyright (c) 2019:
     - chentairan <killasipilin@gmail.com>

    FSD-Project is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FSD-Project is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FSD-Project.  If not, see <https://www.gnu.org/licenses/>.
*/

#ifndef CANSEND_HPP
#define CANSEND_HPP

#include "std_msgs/String.h"
#include "can_msgs/Frame.h"
// #include "common_msgs/ChassisControl.h"
#include "autoware_msgs/ControlCommandStamped.h"

#include "MagneticReq.h"
#include "SteerControl.h"
#include "MotorControl.h"

#include "utils.hpp"

extern SteerControl *steer_control;
extern MagneticReq *magnetic_req;
extern MotorControl *motor_control;

namespace ns_cansend {

struct Para{
  int send_mode;
  int test_steer_angle;
  double test_motor_input;
  double motor_max_rpm;
  double motor_dead_input;
  double steer_max_angle;
  double steer_dead_input;
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
  void setChassisControl(autoware_msgs::ControlCommandStamped msg);
  void setParameters(const Para &msg);

  void runAlgorithm();

 private:

  ros::NodeHandle &nh_;

  // common_msgs::ChassisControl chassis_control_cmd;
  autoware_msgs::ControlCommandStamped ccs;
  
  void sendSteerReq(double steer_cmd,int device_id);

  Para para;
  int loop_number;
  int steer_send_times;
};
}

#endif //CANSEND_HPP
