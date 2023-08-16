;; Auto-generated. Do not edit!


(when (boundp 'simple_lane_detection::object)
  (if (not (find-package "SIMPLE_LANE_DETECTION"))
    (make-package "SIMPLE_LANE_DETECTION"))
  (shadow 'object (find-package "SIMPLE_LANE_DETECTION")))
(unless (find-package "SIMPLE_LANE_DETECTION::OBJECT")
  (make-package "SIMPLE_LANE_DETECTION::OBJECT"))

(in-package "ROS")
;;//! \htmlinclude object.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass simple_lane_detection::object
  :super ros::object
  :slots (_header _left_cx_down _left_cx_upper _left_cy_down _letf_cy_upper _mid_cx_down _mid_cx_upper _mid_cy_down _mid_cy_upper _rig_cx_down _rig_cx_upper _rig_cy_down _rig_cy_upper ))

(defmethod simple_lane_detection::object
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:left_cx_down __left_cx_down) 0.0)
    ((:left_cx_upper __left_cx_upper) 0.0)
    ((:left_cy_down __left_cy_down) 0.0)
    ((:letf_cy_upper __letf_cy_upper) 0.0)
    ((:mid_cx_down __mid_cx_down) 0.0)
    ((:mid_cx_upper __mid_cx_upper) 0.0)
    ((:mid_cy_down __mid_cy_down) 0.0)
    ((:mid_cy_upper __mid_cy_upper) 0.0)
    ((:rig_cx_down __rig_cx_down) 0.0)
    ((:rig_cx_upper __rig_cx_upper) 0.0)
    ((:rig_cy_down __rig_cy_down) 0.0)
    ((:rig_cy_upper __rig_cy_upper) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _left_cx_down (float __left_cx_down))
   (setq _left_cx_upper (float __left_cx_upper))
   (setq _left_cy_down (float __left_cy_down))
   (setq _letf_cy_upper (float __letf_cy_upper))
   (setq _mid_cx_down (float __mid_cx_down))
   (setq _mid_cx_upper (float __mid_cx_upper))
   (setq _mid_cy_down (float __mid_cy_down))
   (setq _mid_cy_upper (float __mid_cy_upper))
   (setq _rig_cx_down (float __rig_cx_down))
   (setq _rig_cx_upper (float __rig_cx_upper))
   (setq _rig_cy_down (float __rig_cy_down))
   (setq _rig_cy_upper (float __rig_cy_upper))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:left_cx_down
   (&optional __left_cx_down)
   (if __left_cx_down (setq _left_cx_down __left_cx_down)) _left_cx_down)
  (:left_cx_upper
   (&optional __left_cx_upper)
   (if __left_cx_upper (setq _left_cx_upper __left_cx_upper)) _left_cx_upper)
  (:left_cy_down
   (&optional __left_cy_down)
   (if __left_cy_down (setq _left_cy_down __left_cy_down)) _left_cy_down)
  (:letf_cy_upper
   (&optional __letf_cy_upper)
   (if __letf_cy_upper (setq _letf_cy_upper __letf_cy_upper)) _letf_cy_upper)
  (:mid_cx_down
   (&optional __mid_cx_down)
   (if __mid_cx_down (setq _mid_cx_down __mid_cx_down)) _mid_cx_down)
  (:mid_cx_upper
   (&optional __mid_cx_upper)
   (if __mid_cx_upper (setq _mid_cx_upper __mid_cx_upper)) _mid_cx_upper)
  (:mid_cy_down
   (&optional __mid_cy_down)
   (if __mid_cy_down (setq _mid_cy_down __mid_cy_down)) _mid_cy_down)
  (:mid_cy_upper
   (&optional __mid_cy_upper)
   (if __mid_cy_upper (setq _mid_cy_upper __mid_cy_upper)) _mid_cy_upper)
  (:rig_cx_down
   (&optional __rig_cx_down)
   (if __rig_cx_down (setq _rig_cx_down __rig_cx_down)) _rig_cx_down)
  (:rig_cx_upper
   (&optional __rig_cx_upper)
   (if __rig_cx_upper (setq _rig_cx_upper __rig_cx_upper)) _rig_cx_upper)
  (:rig_cy_down
   (&optional __rig_cy_down)
   (if __rig_cy_down (setq _rig_cy_down __rig_cy_down)) _rig_cy_down)
  (:rig_cy_upper
   (&optional __rig_cy_upper)
   (if __rig_cy_upper (setq _rig_cy_upper __rig_cy_upper)) _rig_cy_upper)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _left_cx_down
    4
    ;; float32 _left_cx_upper
    4
    ;; float32 _left_cy_down
    4
    ;; float32 _letf_cy_upper
    4
    ;; float32 _mid_cx_down
    4
    ;; float32 _mid_cx_upper
    4
    ;; float32 _mid_cy_down
    4
    ;; float32 _mid_cy_upper
    4
    ;; float32 _rig_cx_down
    4
    ;; float32 _rig_cx_upper
    4
    ;; float32 _rig_cy_down
    4
    ;; float32 _rig_cy_upper
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _left_cx_down
       (sys::poke _left_cx_down (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_cx_upper
       (sys::poke _left_cx_upper (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_cy_down
       (sys::poke _left_cy_down (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _letf_cy_upper
       (sys::poke _letf_cy_upper (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mid_cx_down
       (sys::poke _mid_cx_down (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mid_cx_upper
       (sys::poke _mid_cx_upper (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mid_cy_down
       (sys::poke _mid_cy_down (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mid_cy_upper
       (sys::poke _mid_cy_upper (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rig_cx_down
       (sys::poke _rig_cx_down (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rig_cx_upper
       (sys::poke _rig_cx_upper (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rig_cy_down
       (sys::poke _rig_cy_down (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rig_cy_upper
       (sys::poke _rig_cy_upper (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _left_cx_down
     (setq _left_cx_down (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_cx_upper
     (setq _left_cx_upper (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_cy_down
     (setq _left_cy_down (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _letf_cy_upper
     (setq _letf_cy_upper (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mid_cx_down
     (setq _mid_cx_down (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mid_cx_upper
     (setq _mid_cx_upper (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mid_cy_down
     (setq _mid_cy_down (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mid_cy_upper
     (setq _mid_cy_upper (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rig_cx_down
     (setq _rig_cx_down (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rig_cx_upper
     (setq _rig_cx_upper (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rig_cy_down
     (setq _rig_cy_down (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rig_cy_upper
     (setq _rig_cy_upper (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get simple_lane_detection::object :md5sum-) "10f6e7b97734158810c589b4cdb3ff51")
(setf (get simple_lane_detection::object :datatype-) "simple_lane_detection/object")
(setf (get simple_lane_detection::object :definition-)
      "std_msgs/Header header

float32 left_cx_down 
float32 left_cx_upper
float32 left_cy_down 
float32 letf_cy_upper

float32 mid_cx_down
float32 mid_cx_upper 
float32 mid_cy_down 
float32 mid_cy_upper 

float32 rig_cx_down 
float32 rig_cx_upper 
float32 rig_cy_down 
float32 rig_cy_upper 
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



(provide :simple_lane_detection/object "10f6e7b97734158810c589b4cdb3ff51")


