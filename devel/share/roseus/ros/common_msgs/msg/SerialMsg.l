;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::SerialMsg)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'SerialMsg (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::SERIALMSG")
  (make-package "COMMON_MSGS::SERIALMSG"))

(in-package "ROS")
;;//! \htmlinclude SerialMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass common_msgs::SerialMsg
  :super ros::object
  :slots (_header _data _length ))

(defmethod common_msgs::SerialMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) (make-array 256 :initial-element 0 :element-type :char))
    ((:length __length) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _data __data)
   (setq _length (round __length))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8[256] _data
    (* 1    256)
    ;; int32 _length
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8[256] _data
     (princ _data s)
     ;; int32 _length
       (write-long _length s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8[256] _data
   (setq _data (make-array 256 :element-type :char))
   (replace _data buf :start2 ptr-) (incf ptr- 256)
   ;; int32 _length
     (setq _length (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get common_msgs::SerialMsg :md5sum-) "04e569ccde7b2c8a16c1d0048b38a73e")
(setf (get common_msgs::SerialMsg :datatype-) "common_msgs/SerialMsg")
(setf (get common_msgs::SerialMsg :definition-)
      "std_msgs/Header header

uint8[256] data
int32 length
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



(provide :common_msgs/SerialMsg "04e569ccde7b2c8a16c1d0048b38a73e")


