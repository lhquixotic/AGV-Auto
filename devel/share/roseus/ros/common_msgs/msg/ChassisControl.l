;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::ChassisControl)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'ChassisControl (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::CHASSISCONTROL")
  (make-package "COMMON_MSGS::CHASSISCONTROL"))

(in-package "ROS")
;;//! \htmlinclude ChassisControl.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass common_msgs::ChassisControl
  :super ros::object
  :slots (_header _acc_request _acc_control_mode _acc_loop_number _acc_pedal_open_request _brk_pedal_open_request _steer_enable _steer_angle_velocity _steer_angle ))

(defmethod common_msgs::ChassisControl
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:acc_request __acc_request) 0.0)
    ((:acc_control_mode __acc_control_mode) 0)
    ((:acc_loop_number __acc_loop_number) 0)
    ((:acc_pedal_open_request __acc_pedal_open_request) 0)
    ((:brk_pedal_open_request __brk_pedal_open_request) 0)
    ((:steer_enable __steer_enable) 0)
    ((:steer_angle_velocity __steer_angle_velocity) 0.0)
    ((:steer_angle __steer_angle) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _acc_request (float __acc_request))
   (setq _acc_control_mode (round __acc_control_mode))
   (setq _acc_loop_number (round __acc_loop_number))
   (setq _acc_pedal_open_request (round __acc_pedal_open_request))
   (setq _brk_pedal_open_request (round __brk_pedal_open_request))
   (setq _steer_enable (round __steer_enable))
   (setq _steer_angle_velocity (float __steer_angle_velocity))
   (setq _steer_angle (float __steer_angle))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:acc_request
   (&optional __acc_request)
   (if __acc_request (setq _acc_request __acc_request)) _acc_request)
  (:acc_control_mode
   (&optional __acc_control_mode)
   (if __acc_control_mode (setq _acc_control_mode __acc_control_mode)) _acc_control_mode)
  (:acc_loop_number
   (&optional __acc_loop_number)
   (if __acc_loop_number (setq _acc_loop_number __acc_loop_number)) _acc_loop_number)
  (:acc_pedal_open_request
   (&optional __acc_pedal_open_request)
   (if __acc_pedal_open_request (setq _acc_pedal_open_request __acc_pedal_open_request)) _acc_pedal_open_request)
  (:brk_pedal_open_request
   (&optional __brk_pedal_open_request)
   (if __brk_pedal_open_request (setq _brk_pedal_open_request __brk_pedal_open_request)) _brk_pedal_open_request)
  (:steer_enable
   (&optional __steer_enable)
   (if __steer_enable (setq _steer_enable __steer_enable)) _steer_enable)
  (:steer_angle_velocity
   (&optional __steer_angle_velocity)
   (if __steer_angle_velocity (setq _steer_angle_velocity __steer_angle_velocity)) _steer_angle_velocity)
  (:steer_angle
   (&optional __steer_angle)
   (if __steer_angle (setq _steer_angle __steer_angle)) _steer_angle)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _acc_request
    8
    ;; int32 _acc_control_mode
    4
    ;; int32 _acc_loop_number
    4
    ;; int32 _acc_pedal_open_request
    4
    ;; int32 _brk_pedal_open_request
    4
    ;; int32 _steer_enable
    4
    ;; float64 _steer_angle_velocity
    8
    ;; float64 _steer_angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _acc_request
       (sys::poke _acc_request (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _acc_control_mode
       (write-long _acc_control_mode s)
     ;; int32 _acc_loop_number
       (write-long _acc_loop_number s)
     ;; int32 _acc_pedal_open_request
       (write-long _acc_pedal_open_request s)
     ;; int32 _brk_pedal_open_request
       (write-long _brk_pedal_open_request s)
     ;; int32 _steer_enable
       (write-long _steer_enable s)
     ;; float64 _steer_angle_velocity
       (sys::poke _steer_angle_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steer_angle
       (sys::poke _steer_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _acc_request
     (setq _acc_request (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _acc_control_mode
     (setq _acc_control_mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _acc_loop_number
     (setq _acc_loop_number (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _acc_pedal_open_request
     (setq _acc_pedal_open_request (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _brk_pedal_open_request
     (setq _brk_pedal_open_request (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _steer_enable
     (setq _steer_enable (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _steer_angle_velocity
     (setq _steer_angle_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steer_angle
     (setq _steer_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get common_msgs::ChassisControl :md5sum-) "f4a7a2ade840279ee54283672cf94d29")
(setf (get common_msgs::ChassisControl :datatype-) "common_msgs/ChassisControl")
(setf (get common_msgs::ChassisControl :definition-)
      "std_msgs/Header header

float64 acc_request
int32 acc_control_mode
int32 acc_loop_number
int32 acc_pedal_open_request
int32 brk_pedal_open_request

int32 steer_enable
float64 steer_angle_velocity
float64 steer_angle

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :common_msgs/ChassisControl "f4a7a2ade840279ee54283672cf94d29")


