; Auto-generated. Do not edit!


(cl:in-package simple_lane_detection-msg)


;//! \htmlinclude object.msg.html

(cl:defclass <object> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (left_cx_down
    :reader left_cx_down
    :initarg :left_cx_down
    :type cl:float
    :initform 0.0)
   (left_cx_upper
    :reader left_cx_upper
    :initarg :left_cx_upper
    :type cl:float
    :initform 0.0)
   (left_cy_down
    :reader left_cy_down
    :initarg :left_cy_down
    :type cl:float
    :initform 0.0)
   (letf_cy_upper
    :reader letf_cy_upper
    :initarg :letf_cy_upper
    :type cl:float
    :initform 0.0)
   (mid_cx_down
    :reader mid_cx_down
    :initarg :mid_cx_down
    :type cl:float
    :initform 0.0)
   (mid_cx_upper
    :reader mid_cx_upper
    :initarg :mid_cx_upper
    :type cl:float
    :initform 0.0)
   (mid_cy_down
    :reader mid_cy_down
    :initarg :mid_cy_down
    :type cl:float
    :initform 0.0)
   (mid_cy_upper
    :reader mid_cy_upper
    :initarg :mid_cy_upper
    :type cl:float
    :initform 0.0)
   (rig_cx_down
    :reader rig_cx_down
    :initarg :rig_cx_down
    :type cl:float
    :initform 0.0)
   (rig_cx_upper
    :reader rig_cx_upper
    :initarg :rig_cx_upper
    :type cl:float
    :initform 0.0)
   (rig_cy_down
    :reader rig_cy_down
    :initarg :rig_cy_down
    :type cl:float
    :initform 0.0)
   (rig_cy_upper
    :reader rig_cy_upper
    :initarg :rig_cy_upper
    :type cl:float
    :initform 0.0))
)

(cl:defclass object (<object>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <object>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'object)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name simple_lane_detection-msg:<object> is deprecated: use simple_lane_detection-msg:object instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:header-val is deprecated.  Use simple_lane_detection-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'left_cx_down-val :lambda-list '(m))
(cl:defmethod left_cx_down-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:left_cx_down-val is deprecated.  Use simple_lane_detection-msg:left_cx_down instead.")
  (left_cx_down m))

(cl:ensure-generic-function 'left_cx_upper-val :lambda-list '(m))
(cl:defmethod left_cx_upper-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:left_cx_upper-val is deprecated.  Use simple_lane_detection-msg:left_cx_upper instead.")
  (left_cx_upper m))

(cl:ensure-generic-function 'left_cy_down-val :lambda-list '(m))
(cl:defmethod left_cy_down-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:left_cy_down-val is deprecated.  Use simple_lane_detection-msg:left_cy_down instead.")
  (left_cy_down m))

(cl:ensure-generic-function 'letf_cy_upper-val :lambda-list '(m))
(cl:defmethod letf_cy_upper-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:letf_cy_upper-val is deprecated.  Use simple_lane_detection-msg:letf_cy_upper instead.")
  (letf_cy_upper m))

(cl:ensure-generic-function 'mid_cx_down-val :lambda-list '(m))
(cl:defmethod mid_cx_down-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:mid_cx_down-val is deprecated.  Use simple_lane_detection-msg:mid_cx_down instead.")
  (mid_cx_down m))

(cl:ensure-generic-function 'mid_cx_upper-val :lambda-list '(m))
(cl:defmethod mid_cx_upper-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:mid_cx_upper-val is deprecated.  Use simple_lane_detection-msg:mid_cx_upper instead.")
  (mid_cx_upper m))

(cl:ensure-generic-function 'mid_cy_down-val :lambda-list '(m))
(cl:defmethod mid_cy_down-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:mid_cy_down-val is deprecated.  Use simple_lane_detection-msg:mid_cy_down instead.")
  (mid_cy_down m))

(cl:ensure-generic-function 'mid_cy_upper-val :lambda-list '(m))
(cl:defmethod mid_cy_upper-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:mid_cy_upper-val is deprecated.  Use simple_lane_detection-msg:mid_cy_upper instead.")
  (mid_cy_upper m))

(cl:ensure-generic-function 'rig_cx_down-val :lambda-list '(m))
(cl:defmethod rig_cx_down-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:rig_cx_down-val is deprecated.  Use simple_lane_detection-msg:rig_cx_down instead.")
  (rig_cx_down m))

(cl:ensure-generic-function 'rig_cx_upper-val :lambda-list '(m))
(cl:defmethod rig_cx_upper-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:rig_cx_upper-val is deprecated.  Use simple_lane_detection-msg:rig_cx_upper instead.")
  (rig_cx_upper m))

(cl:ensure-generic-function 'rig_cy_down-val :lambda-list '(m))
(cl:defmethod rig_cy_down-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:rig_cy_down-val is deprecated.  Use simple_lane_detection-msg:rig_cy_down instead.")
  (rig_cy_down m))

(cl:ensure-generic-function 'rig_cy_upper-val :lambda-list '(m))
(cl:defmethod rig_cy_upper-val ((m <object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader simple_lane_detection-msg:rig_cy_upper-val is deprecated.  Use simple_lane_detection-msg:rig_cy_upper instead.")
  (rig_cy_upper m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <object>) ostream)
  "Serializes a message object of type '<object>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_cx_down))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_cx_upper))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_cy_down))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'letf_cy_upper))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mid_cx_down))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mid_cx_upper))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mid_cy_down))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mid_cy_upper))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rig_cx_down))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rig_cx_upper))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rig_cy_down))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rig_cy_upper))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <object>) istream)
  "Deserializes a message object of type '<object>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_cx_down) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_cx_upper) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_cy_down) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'letf_cy_upper) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mid_cx_down) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mid_cx_upper) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mid_cy_down) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mid_cy_upper) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rig_cx_down) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rig_cx_upper) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rig_cy_down) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rig_cy_upper) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<object>)))
  "Returns string type for a message object of type '<object>"
  "simple_lane_detection/object")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'object)))
  "Returns string type for a message object of type 'object"
  "simple_lane_detection/object")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<object>)))
  "Returns md5sum for a message object of type '<object>"
  "10f6e7b97734158810c589b4cdb3ff51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'object)))
  "Returns md5sum for a message object of type 'object"
  "10f6e7b97734158810c589b4cdb3ff51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<object>)))
  "Returns full string definition for message of type '<object>"
  (cl:format cl:nil "std_msgs/Header header~%~%float32 left_cx_down ~%float32 left_cx_upper~%float32 left_cy_down ~%float32 letf_cy_upper~%~%float32 mid_cx_down~%float32 mid_cx_upper ~%float32 mid_cy_down ~%float32 mid_cy_upper ~%~%float32 rig_cx_down ~%float32 rig_cx_upper ~%float32 rig_cy_down ~%float32 rig_cy_upper ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'object)))
  "Returns full string definition for message of type 'object"
  (cl:format cl:nil "std_msgs/Header header~%~%float32 left_cx_down ~%float32 left_cx_upper~%float32 left_cy_down ~%float32 letf_cy_upper~%~%float32 mid_cx_down~%float32 mid_cx_upper ~%float32 mid_cy_down ~%float32 mid_cy_upper ~%~%float32 rig_cx_down ~%float32 rig_cx_upper ~%float32 rig_cy_down ~%float32 rig_cy_upper ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <object>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <object>))
  "Converts a ROS message object to a list"
  (cl:list 'object
    (cl:cons ':header (header msg))
    (cl:cons ':left_cx_down (left_cx_down msg))
    (cl:cons ':left_cx_upper (left_cx_upper msg))
    (cl:cons ':left_cy_down (left_cy_down msg))
    (cl:cons ':letf_cy_upper (letf_cy_upper msg))
    (cl:cons ':mid_cx_down (mid_cx_down msg))
    (cl:cons ':mid_cx_upper (mid_cx_upper msg))
    (cl:cons ':mid_cy_down (mid_cy_down msg))
    (cl:cons ':mid_cy_upper (mid_cy_upper msg))
    (cl:cons ':rig_cx_down (rig_cx_down msg))
    (cl:cons ':rig_cx_upper (rig_cx_upper msg))
    (cl:cons ':rig_cy_down (rig_cy_down msg))
    (cl:cons ':rig_cy_upper (rig_cy_upper msg))
))
