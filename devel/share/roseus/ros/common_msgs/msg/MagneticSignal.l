;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::MagneticSignal)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'MagneticSignal (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::MAGNETICSIGNAL")
  (make-package "COMMON_MSGS::MAGNETICSIGNAL"))

(in-package "ROS")
;;//! \htmlinclude MagneticSignal.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass common_msgs::MagneticSignal
  :super ros::object
  :slots (_header _intensity _current_loc _middle_loc ))

(defmethod common_msgs::MagneticSignal
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:intensity __intensity) 0)
    ((:current_loc __current_loc) 0)
    ((:middle_loc __middle_loc) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _intensity (round __intensity))
   (setq _current_loc (round __current_loc))
   (setq _middle_loc (round __middle_loc))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:intensity
   (&optional __intensity)
   (if __intensity (setq _intensity __intensity)) _intensity)
  (:current_loc
   (&optional __current_loc)
   (if __current_loc (setq _current_loc __current_loc)) _current_loc)
  (:middle_loc
   (&optional __middle_loc)
   (if __middle_loc (setq _middle_loc __middle_loc)) _middle_loc)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _intensity
    4
    ;; int32 _current_loc
    4
    ;; int32 _middle_loc
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _intensity
       (write-long _intensity s)
     ;; int32 _current_loc
       (write-long _current_loc s)
     ;; int32 _middle_loc
       (write-long _middle_loc s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _intensity
     (setq _intensity (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _current_loc
     (setq _current_loc (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _middle_loc
     (setq _middle_loc (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common_msgs::MagneticSignal :md5sum-) "2ef1a2bcbce072ce84a5a2982b030642")
(setf (get common_msgs::MagneticSignal :datatype-) "common_msgs/MagneticSignal")
(setf (get common_msgs::MagneticSignal :definition-)
      "std_msgs/Header header

int32 intensity
int32 current_loc
int32 middle_loc
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



(provide :common_msgs/MagneticSignal "2ef1a2bcbce072ce84a5a2982b030642")


