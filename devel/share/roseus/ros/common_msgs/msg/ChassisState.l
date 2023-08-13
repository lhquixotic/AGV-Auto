;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::ChassisState)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'ChassisState (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::CHASSISSTATE")
  (make-package "COMMON_MSGS::CHASSISSTATE"))

(in-package "ROS")
;;//! \htmlinclude ChassisState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass common_msgs::ChassisState
  :super ros::object
  :slots (_header _real_acc_pedal _real_brake_pedal _real_steer_angle_left _real_steer_angle_right _vehicle_lon_acceleration ))

(defmethod common_msgs::ChassisState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:real_acc_pedal __real_acc_pedal) 0)
    ((:real_brake_pedal __real_brake_pedal) 0)
    ((:real_steer_angle_left __real_steer_angle_left) 0.0)
    ((:real_steer_angle_right __real_steer_angle_right) 0.0)
    ((:vehicle_lon_acceleration __vehicle_lon_acceleration) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _real_acc_pedal (round __real_acc_pedal))
   (setq _real_brake_pedal (round __real_brake_pedal))
   (setq _real_steer_angle_left (float __real_steer_angle_left))
   (setq _real_steer_angle_right (float __real_steer_angle_right))
   (setq _vehicle_lon_acceleration (float __vehicle_lon_acceleration))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:real_acc_pedal
   (&optional __real_acc_pedal)
   (if __real_acc_pedal (setq _real_acc_pedal __real_acc_pedal)) _real_acc_pedal)
  (:real_brake_pedal
   (&optional __real_brake_pedal)
   (if __real_brake_pedal (setq _real_brake_pedal __real_brake_pedal)) _real_brake_pedal)
  (:real_steer_angle_left
   (&optional __real_steer_angle_left)
   (if __real_steer_angle_left (setq _real_steer_angle_left __real_steer_angle_left)) _real_steer_angle_left)
  (:real_steer_angle_right
   (&optional __real_steer_angle_right)
   (if __real_steer_angle_right (setq _real_steer_angle_right __real_steer_angle_right)) _real_steer_angle_right)
  (:vehicle_lon_acceleration
   (&optional __vehicle_lon_acceleration)
   (if __vehicle_lon_acceleration (setq _vehicle_lon_acceleration __vehicle_lon_acceleration)) _vehicle_lon_acceleration)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _real_acc_pedal
    1
    ;; uint8 _real_brake_pedal
    1
    ;; float64 _real_steer_angle_left
    8
    ;; float64 _real_steer_angle_right
    8
    ;; float64 _vehicle_lon_acceleration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _real_acc_pedal
       (write-byte _real_acc_pedal s)
     ;; uint8 _real_brake_pedal
       (write-byte _real_brake_pedal s)
     ;; float64 _real_steer_angle_left
       (sys::poke _real_steer_angle_left (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _real_steer_angle_right
       (sys::poke _real_steer_angle_right (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vehicle_lon_acceleration
       (sys::poke _vehicle_lon_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _real_acc_pedal
     (setq _real_acc_pedal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _real_brake_pedal
     (setq _real_brake_pedal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _real_steer_angle_left
     (setq _real_steer_angle_left (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _real_steer_angle_right
     (setq _real_steer_angle_right (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vehicle_lon_acceleration
     (setq _vehicle_lon_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get common_msgs::ChassisState :md5sum-) "250f4d938e1a97be304a5f49b807d794")
(setf (get common_msgs::ChassisState :datatype-) "common_msgs/ChassisState")
(setf (get common_msgs::ChassisState :definition-)
      "std_msgs/Header header

# real acc pedal value
uint8 real_acc_pedal

# real brake pedal value
uint8 real_brake_pedal

# real steering wheel angle
float64 real_steer_angle_left
float64 real_steer_angle_right

# vehicle longitudinal acceleration
float64 vehicle_lon_acceleration
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



(provide :common_msgs/ChassisState "250f4d938e1a97be304a5f49b807d794")


