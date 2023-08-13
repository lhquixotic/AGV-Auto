;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::VirtualVehicleState)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'VirtualVehicleState (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::VIRTUALVEHICLESTATE")
  (make-package "COMMON_MSGS::VIRTUALVEHICLESTATE"))

(in-package "ROS")
;;//! \htmlinclude VirtualVehicleState.msg.html
(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass common_msgs::VirtualVehicleState
  :super ros::object
  :slots (_header _chassis_state _utmpose _distance ))

(defmethod common_msgs::VirtualVehicleState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:chassis_state __chassis_state) (instance common_msgs::ChassisState :init))
    ((:utmpose __utmpose) (instance nav_msgs::Odometry :init))
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _chassis_state __chassis_state)
   (setq _utmpose __utmpose)
   (setq _distance (float __distance))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:chassis_state
   (&rest __chassis_state)
   (if (keywordp (car __chassis_state))
       (send* _chassis_state __chassis_state)
     (progn
       (if __chassis_state (setq _chassis_state (car __chassis_state)))
       _chassis_state)))
  (:utmpose
   (&rest __utmpose)
   (if (keywordp (car __utmpose))
       (send* _utmpose __utmpose)
     (progn
       (if __utmpose (setq _utmpose (car __utmpose)))
       _utmpose)))
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; common_msgs/ChassisState _chassis_state
    (send _chassis_state :serialization-length)
    ;; nav_msgs/Odometry _utmpose
    (send _utmpose :serialization-length)
    ;; float64 _distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; common_msgs/ChassisState _chassis_state
       (send _chassis_state :serialize s)
     ;; nav_msgs/Odometry _utmpose
       (send _utmpose :serialize s)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; common_msgs/ChassisState _chassis_state
     (send _chassis_state :deserialize buf ptr-) (incf ptr- (send _chassis_state :serialization-length))
   ;; nav_msgs/Odometry _utmpose
     (send _utmpose :deserialize buf ptr-) (incf ptr- (send _utmpose :serialization-length))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get common_msgs::VirtualVehicleState :md5sum-) "db3fe834d391bbb120083ed33a99aba4")
(setf (get common_msgs::VirtualVehicleState :datatype-) "common_msgs/VirtualVehicleState")
(setf (get common_msgs::VirtualVehicleState :definition-)
      "std_msgs/Header header

# chassis state
common_msgs/ChassisState chassis_state

# localization information
nav_msgs/Odometry utmpose

# distance 
float64 distance
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

================================================================================
MSG: common_msgs/ChassisState
std_msgs/Header header

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
MSG: nav_msgs/Odometry
# This represents an estimate of a position and velocity in free space.  
# The pose in this message should be specified in the coordinate frame given by header.frame_id.
# The twist in this message should be specified in the coordinate frame given by the child_frame_id
Header header
string child_frame_id
geometry_msgs/PoseWithCovariance pose
geometry_msgs/TwistWithCovariance twist

================================================================================
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :common_msgs/VirtualVehicleState "db3fe834d391bbb120083ed33a99aba4")


