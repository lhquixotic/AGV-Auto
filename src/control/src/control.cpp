#include <ros/ros.h>
#include "control.hpp"
#include <sstream>

namespace ns_control
{
  // Constructor
  Control::Control(ros::NodeHandle &nh) : nh_(nh),
                                          pid_controller(1.0, 0.0, 0.0){
                                            is_initialized = false;
                                            auto_control_enable = false;
                                            kept_rfid_value = 0;
                                          };

  // Getters
  autoware_msgs::ControlCommandStamped Control::getControlCommand() { 
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

  void Control::setPidParameters(const Pid_para &msg){
    pid_para = msg;
    pid_controller.kp = pid_para.kp;
    pid_controller.ki = pid_para.ki;
    pid_controller.kd = pid_para.kd;
  }

  void Control::setControlParameters(const Para &msg){
    control_para = msg;
  }

  void Control::updateStateMachine(){
    // Initialization
    if (!is_initialized){
      // initialization
      kept_remote_mode = remote_control.mode;
      kept_rfid_stop = rfid_stop;
      is_initialized = true;
      auto_control_enable = true;
    }else{
      // Update state machine
      if ((kept_rfid_stop==0)&&(rfid_stop==1)){
        auto_control_enable = false;
      }
      if ((kept_remote_mode==2)&&(remote_control.mode==3)){
        auto_control_enable = false;
      }
      if ((kept_remote_mode==3)&&(remote_control.mode==2)){
        auto_control_enable = true;
      }
      // Update the kept values
      kept_remote_mode = remote_control.mode;
      kept_rfid_stop = rfid_stop;
    }
  }

  void Control::runAlgorithm(){
    ROS_DEBUG("[Control]In run() ... ");
    // 判断逻辑：
    // 判断是否接收到遥控器指令及读取遥控器模式：如果模式为0-手动模式，输出控制量为遥控器控制量；
    // 如果为自动模式，判断是否读取到磁条信号【并判断rfid】，如果没有读取到磁条信号(1.未收到磁
    // 条消息，2.收到的磁条报文中解析出磁感应强度为0)，进行警告，
    // 不进行控制，如果读取到磁条信号，进行纵横向控制。[允许自动控制条件] 
    //（1）正常行驶状态：处于自动控制模式-2 且 rfid信号为0；
    //（2）打卡停车状态：检测到rfid由0变1就控制停车||控制由2变3；
    //（3）步进启动状态：控制由3变2可以再次启动。

    if (remoteControlFlag){
      // ROS_INFO_STREAM("control mode: "<<remote_control.mode);
      // Update RFID stop
      // 如果接收到17位长度的报文，为RFID的有效报文，此时读取第7位寄存，如果先前
      // 寄存数据与当前读取数据不一致，且当前数据不为0；则出发stop。
      int signal_len = rfid_signal.length;
      if(signal_len == 17){//valid message
        int rfid_value = rfid_signal.data[7];
        if ((rfid_value != kept_rfid_value) && (rfid_value != 0)){
          rfid_stop = 1;
        }else{
          rfid_stop = 0;
        }
      }

      // Switch remote control mode
      switch (remote_control.mode)
      {
      case 0:  // manual control mode
        control_cmd.control_mode = 1;
        control_cmd.linear_velocity = remote_control.accel;
        control_cmd.steering_angle = remote_control.steer;
        is_initialized = false;
        auto_control_enable = false;
        break;
      
      case 2: // automatic control mode
        // update the state machine
        updateStateMachine();

        control_cmd.control_mode = 2;
        if((!magneticSignalFlag)||(magnetic_signal.intensity == 0)||(!auto_control_enable)){
          if(!magneticSignalFlag){ROS_WARN("[Control] Stop because no magnetic signal received.")};
          if(magnetic_signal.intensity == 0){ROS_WARN("[Control] Stop because magnetic intensity is 0.")};
          if(!auto_control_enable){ROSINFO("[Control] Stop because rfid is detected.")};
          control_cmd.linear_velocity = 0;
          control_cmd.steering_angle = 0;
        }else{
          control_cmd.steering_angle = pid_controller.outputSignal(magnetic_signal.middle_loc,magnetic_signal.current_loc);
          control_cmd.linear_velocity = control_para.desired_speed; // TODO:calculate the control value
        }
        break;

      case 3: // step forward control mode
        updateStateMachine();
        break;
      
      default: // 
        ROS_WARN("[Control] WARN: Remote control set wrong control mode.");
        break;
      }
      if(!control_para.longitudinal_control_switch){//disable longitudianl control
        ROS_INFO("[Control] Disable longitudinal control!");
        control_cmd.linear_velocity = 0;
      }
      if(!control_para.lateral_control_switch){//disable lateral control
        ROS_INFO("[Control] Disable lateral control!");
        control_cmd.steering_angle = 0;
      }
      // Display control value
      // ROS_INFO_STREAM("[Control] Mode: " << control_cmd.control_mode << ", steer: " << control_cmd.steering_angle << ", speed: " << control_cmd.linear_velocity);

    }else{
      ROS_ERROR("[Control] FATAL: No remote controller detected!");
    }

  }

}
