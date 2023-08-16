;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::Trigger)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'Trigger (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::TRIGGER")
  (make-package "COMMON_MSGS::TRIGGER"))

(in-package "ROS")
;;//! \htmlinclude Trigger.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass common_msgs::Trigger
  :super ros::object
  :slots (_header _trigger ))

(defmethod common_msgs::Trigger
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:trigger __trigger) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _trigger __trigger)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:trigger
   (&optional __trigger)
   (if __trigger (setq _trigger __trigger)) _trigger)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _trigger
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _trigger
       (if _trigger (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _trigger
     (setq _trigger (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get common_msgs::Trigger :md5sum-) "cb381b11b4dbec913c041cb0ec39302e")
(setf (get common_msgs::Trigger :datatype-) "common_msgs/Trigger")
(setf (get common_msgs::Trigger :definition-)
      "std_msgs/Header header

# trigger signal
bool trigger
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



(provide :common_msgs/Trigger "cb381b11b4dbec913c041cb0ec39302e")


