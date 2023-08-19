#include <ros/ros.h>
#include "control.hpp"
#include "utils.hpp"
#include <sstream>

namespace ns_control
{
  // Constructor
  Control::Control(ros::NodeHandle &nh) : nh_(nh),
                                          magnet_pid_controller(1.0, 0.0, 0.0){
                                            is_initialized = false;
                                            auto_control_enable = false;
                                            rfid_stop=0;
                                            kept_rfid_value = 0;
                                            kept_rfid_stop = 0;
                                            loop_number = 0;
                                            kept_magnetic_loc = 99;
                                            magnetic_missing_time = 0;
                                            lane_error = 0;
                                            manual_switch = 0;
                                            kept_manual_switch = 0;
                                            control_mode = 1;
                                          };

  // Getters
  common_msgs::ControlCommandStamped Control::getControlCommand() { 
    ccs.cmd = control_cmd;
    ccs.header.frame_id = "vehicle";
    ccs.header.stamp = ros::Time::now();
    return ccs; 
    }

  // Setters
  void Control::setRemoteControl(const common_msgs::RemoteControl &msg){
    remote_control = msg;
  }
  void Control::setRfidSignal(const common_msgs::SerialMsg &msg){
    rfid_signal = msg;
  }
  void Control::setMagneticSignal(const common_msgs::MagneticSignal &msg){
    magnetic_signal = msg;
  }
  void Control::setChassisState(const common_msgs::ChassisState &msg){
    chassis_state = msg;
  }
  void Control::setLaneDetection(const simple_lane_detection::object &msg){
    lane_detection = msg;
    int lane_mid = msg.mid_cx_down;
    lane_error = int((lane_mid - control_para.lane_mid_reference) / control_para.visual_scale);
  }

  void Control::setMagnetPidParameters(const Pid_para &msg){
    magnet_error_pid_para = msg;
    magnet_pid_controller.kp = magnet_error_pid_para.kp;
    magnet_pid_controller.ki = magnet_error_pid_para.ki;
    magnet_pid_controller.kd = magnet_error_pid_para.kd;
  }

  void Control::setControlParameters(const Para &msg){
    control_para = msg;
  }

  void Control::updateRfid(){
    // Update RFID stop
    // 如果接收到17位长度的报文，为RFID的有效报文，此时读取第7位寄存，如果先前
    // 寄存数据与当前读取数据不一致，且当前数据不为0；则出发stop。
    int signal_len = rfid_signal.length;
    if(signal_len == 17){//valid message
      int rfid_value = rfid_signal.data[7];
      // ROS_INFO_STREAM("RFID Read, data: "<<rfid_value);
      if ((rfid_value != kept_rfid_value) && (rfid_value != 0)){
        // ROS_INFO_STREAM("[Control] rfid value: "<<rfid_value<<", kept_rfid_value: "<<kept_rfid_value);
        ROS_INFO("[Control] Stop because rfid is detected.");
        rfid_stop = 1;
      }else{
        rfid_stop = 0;
      }
      kept_rfid_value = rfid_value;
    }
  }

  void Control::updateManualSwitchState(){
    // Manual switch state update
    if (loop_number%10 == 0){
      std::ofstream gpioStream("/sys/class/gpio/gpio377/value");
      int gpio_value;
      gpioStream >> gpio_value;
      manual_switch = gpio_value;
    }
  }

  void Control::updateStateMachine(){
    if (!is_initialized){
        // Initialization (when 1->2)
        kept_remote_mode = 2;
        kept_rfid_stop = 0;
        is_initialized = true;
        auto_control_enable = true;
    }else{
      // Update state machine
      if ((kept_rfid_stop==0)&&(rfid_stop==1)){
        auto_control_enable = false;
      }
      if (kept_remote_mode==3||kept_manual_switch==1){
        auto_control_enable = true;
      }
      // Update the kept values
      kept_rfid_stop = rfid_stop;
    }
  }

  void Control::magneticControl(){
    if(((!magneticSignalFlag))||((magnetic_signal.intensity == 0)&&(kept_magnetic_loc==99))){
      // if no magnetic signal recved || current and kept intensity is zero 
      control_cmd.linear_velocity = 0;
      control_cmd.steering_angle = 0;
    }else{
      // Get current reference magnetic location
      int cur_magnetic_loc;
      if (magnetic_signal.intensity == 0){
        // current intensity is zero but kept intensity is not zero
        cur_magnetic_loc = kept_magnetic_loc;
        magnetic_missing_time ++;
        if (magnetic_missing_time >= control_para.max_magnetic_missing_time){auto_control_enable=false;}
      }else{
        // current intensity is not zero
        cur_magnetic_loc = magnetic_signal.current_loc;
        kept_magnetic_loc = cur_magnetic_loc;
      }
      error_input = magnetic_signal.middle_loc - cur_magnetic_loc; // error -, left turn
    }
    // Print
    if(loop_number%25 == 0){
      ROS_INFO("[Magnetic] magnetic_error: %d.", error_input);
    }
  }

  void Control::visualControl(){

  }

  void Control::runAlgorithm(){
    loop_number ++;

    // 判断逻辑：
    // 判断是否接收到遥控器指令及读取遥控器模式：如果模式为0-手动模式，输出控制量为遥控器控制量；
    // 如果为自动模式，判断是否读取到磁条信号【并判断rfid】，如果没有读取到磁条信号(1.未收到磁
    // 条消息，2.收到的磁条报文中解析出磁感应强度为0)，进行警告，
    // 不进行控制，如果读取到磁条信号，进行纵横向控制。[允许自动控制条件] 
    //（1）正常行驶状态：处于自动控制模式-2 且 rfid信号为0；
    //（2）打卡停车状态：检测到rfid由0变1就控制停车||控制由2变3；
    //（3）步进启动状态：控制由3变2可以再次启动。

    // 整体控制逻辑：
    // 1. 【遥控器模式】：按下 *遥控器使能开关*，只能进行遥控器控制，控制逻辑同上；
    // 2. 【手动开关模式】：关闭 *遥控器使能开关*，只能进行手动开关控制，状态为自动控制/锁止状态。

    updateRemoteEnable(); // update eanble remote control button state

    if (control_para.always_enable_manual_switch)enable_remote_control=false;
    if (control_para.always_enable_remote_control)enable_remote_control=true;

    // choose control_mode mode
    if (enable_remote_control){// only remote control
      if(remoteControlFlag){
        if (kept_remote_mode!=remote_control.mode){ROS_INFO("Remote control mode: %d",remote_control.mode);}
        control_mode = remote_control.mode}
      else {
        contro_mode = 3;
        ROS_ERROR("[Control] FATAL: No remote controller detected!");}
    }else{// only manual switch control
      if (kept_manual_switch!=manual_switch){ROS_INFO("Manual switch mode: %d",manual_switch);}
      if(manual_switch == 0) control_mode = 3;
      else control_mode = 2;
    }
    // switch control_mode to control
    switch (control_mode){
      case 0:// * [Only Remote] manual control
        control_cmd.control_mode = 1;
        control_cmd.linear_velocity = remote_control.accel;
        control_cmd.steering_angle = remote_control.steer;
        is_initialized = false;
        auto_control_enable = false;
        kept_rfid_value = 0;
        kept_magnetic_loc = 99;
        magnetic_missing_time = 0;
        break;
      case 2:
        updateStateMachine();
        updateRfid();
        control_cmd.control_mode = 2;

        // calculate control cmd value
        if (!auto_control_eanble){
          control_cmd.linear_velocity = 0;
          control_cmd.steering_angle = 0;
        }else{
          // choose sensor type
          if (!control_para.enable_visual_control)magneticControl();
          else visualControl();
          // output control value
          // Use current reference magnetic location for steering
          double desired_angle = magnet_pid_controller.outputSignal(error_input,0);
          desired_angle = clamp(desired_angle,-control_para.max_steer_angle,control_para.max_steer_angle);

          control_cmd.steering_angle = desired_angle;

          // Driving
          control_cmd.linear_velocity = control_para.desired_speed;
        }
        // 
        break;
      case 3:
        control_cmd.control_mode = 3;
        control_cmd.linear_velocity = 0;
        control_cmd.steering_angle = 0;
        break;
      default:
        ROS_WARN("[Control] WARN: Remote control set wrong control mode.");
        break;
    }

    // update kept value
    if (enbale_remote_control) kept_remote_mode = remote_control.mode;
    else kept_manual_control = manual_control;

    // switch for longitudinal and lateral control
    if(!control_para.longitudinal_control_switch){//disable longitudianl control
      ROS_INFO("[Control] Disable longitudinal control!");
      control_cmd.linear_velocity = 0;
    }

    if(!control_para.lateral_control_switch){//disable lateral control
      ROS_INFO("[Control] Disable lateral control!");
      control_cmd.steering_angle = 0;
    }

  }
}
