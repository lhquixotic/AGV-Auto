;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::RemoteControl)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'RemoteControl (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::REMOTECONTROL")
  (make-package "COMMON_MSGS::REMOTECONTROL"))

(in-package "ROS")
;;//! \htmlinclude RemoteControl.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass common_msgs::RemoteControl
  :super ros::object
  :slots (_header _mode _accel _steer ))

(defmethod common_msgs::RemoteControl
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:mode __mode) 0)
    ((:accel __accel) 0.0)
    ((:steer __steer) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _mode (round __mode))
   (setq _accel (float __accel))
   (setq _steer (float __steer))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:steer
   (&optional __steer)
   (if __steer (setq _steer __steer)) _steer)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _mode
    1
    ;; float32 _accel
    4
    ;; float32 _steer
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _mode
       (write-byte _mode s)
     ;; float32 _accel
       (sys::poke _accel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steer
       (sys::poke _steer (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mode 127) (setq _mode (- _mode 256)))
   ;; float32 _accel
     (setq _accel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steer
     (setq _steer (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common_msgs::RemoteControl :md5sum-) "5f4f51bd3e431e8821d9e9c70319162b")
(setf (get common_msgs::RemoteControl :datatype-) "common_msgs/RemoteControl")
(setf (get common_msgs::RemoteControl :definition-)
      "std_msgs/Header header

int8 mode
float32 accel #[-1.0,1.0]
float32 steer #[-1.0,1.0]
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



(provide :common_msgs/RemoteControl "5f4f51bd3e431e8821d9e9c70319162b")


