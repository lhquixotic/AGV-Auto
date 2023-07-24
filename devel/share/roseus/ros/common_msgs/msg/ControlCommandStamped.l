;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::ControlCommandStamped)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'ControlCommandStamped (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::CONTROLCOMMANDSTAMPED")
  (make-package "COMMON_MSGS::CONTROLCOMMANDSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude ControlCommandStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass common_msgs::ControlCommandStamped
  :super ros::object
  :slots (_header _cmd ))

(defmethod common_msgs::ControlCommandStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:cmd __cmd) (instance common_msgs::ControlCommand :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _cmd __cmd)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:cmd
   (&rest __cmd)
   (if (keywordp (car __cmd))
       (send* _cmd __cmd)
     (progn
       (if __cmd (setq _cmd (car __cmd)))
       _cmd)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; common_msgs/ControlCommand _cmd
    (send _cmd :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; common_msgs/ControlCommand _cmd
       (send _cmd :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; common_msgs/ControlCommand _cmd
     (send _cmd :deserialize buf ptr-) (incf ptr- (send _cmd :serialization-length))
   ;;
   self)
  )

(setf (get common_msgs::ControlCommandStamped :md5sum-) "15a14ff20d13f2a22f6f3e667fbc7bc4")
(setf (get common_msgs::ControlCommandStamped :datatype-) "common_msgs/ControlCommandStamped")
(setf (get common_msgs::ControlCommandStamped :definition-)
      "Header header
ControlCommand cmd

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
MSG: common_msgs/ControlCommand
int8 control_mode   # 1 for manual control
float64 linear_velocity
float64 linear_acceleration #m/s^2
float64 steering_angle

")



(provide :common_msgs/ControlCommandStamped "15a14ff20d13f2a22f6f3e667fbc7bc4")


