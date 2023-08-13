;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::ControlState)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'ControlState (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::CONTROLSTATE")
  (make-package "COMMON_MSGS::CONTROLSTATE"))

(in-package "ROS")
;;//! \htmlinclude ControlState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass common_msgs::ControlState
  :super ros::object
  :slots (_header _lateral_error _heading_error _dot_lateral_error _dot_heading_error ))

(defmethod common_msgs::ControlState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lateral_error __lateral_error) 0.0)
    ((:heading_error __heading_error) 0.0)
    ((:dot_lateral_error __dot_lateral_error) 0.0)
    ((:dot_heading_error __dot_heading_error) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _lateral_error (float __lateral_error))
   (setq _heading_error (float __heading_error))
   (setq _dot_lateral_error (float __dot_lateral_error))
   (setq _dot_heading_error (float __dot_heading_error))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lateral_error
   (&optional __lateral_error)
   (if __lateral_error (setq _lateral_error __lateral_error)) _lateral_error)
  (:heading_error
   (&optional __heading_error)
   (if __heading_error (setq _heading_error __heading_error)) _heading_error)
  (:dot_lateral_error
   (&optional __dot_lateral_error)
   (if __dot_lateral_error (setq _dot_lateral_error __dot_lateral_error)) _dot_lateral_error)
  (:dot_heading_error
   (&optional __dot_heading_error)
   (if __dot_heading_error (setq _dot_heading_error __dot_heading_error)) _dot_heading_error)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _lateral_error
    8
    ;; float64 _heading_error
    8
    ;; float64 _dot_lateral_error
    8
    ;; float64 _dot_heading_error
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _lateral_error
       (sys::poke _lateral_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _heading_error
       (sys::poke _heading_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dot_lateral_error
       (sys::poke _dot_lateral_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _dot_heading_error
       (sys::poke _dot_heading_error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _lateral_error
     (setq _lateral_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _heading_error
     (setq _heading_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dot_lateral_error
     (setq _dot_lateral_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _dot_heading_error
     (setq _dot_heading_error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get common_msgs::ControlState :md5sum-) "482c5c5ba4aa1b0cca755e883ff62627")
(setf (get common_msgs::ControlState :datatype-) "common_msgs/ControlState")
(setf (get common_msgs::ControlState :definition-)
      "std_msgs/Header header

# lateral error 
float64 lateral_error

# heading error
float64 heading_error

# dot lateral error
float64 dot_lateral_error

# dot heading error
float64 dot_heading_error
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



(provide :common_msgs/ControlState "482c5c5ba4aa1b0cca755e883ff62627")


