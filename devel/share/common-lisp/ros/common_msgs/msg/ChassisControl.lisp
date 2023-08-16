; Auto-generated. Do not edit!


(cl:in-package common_msgs-msg)


;//! \htmlinclude ChassisControl.msg.html

(cl:defclass <ChassisControl> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (acc_request
    :reader acc_request
    :initarg :acc_request
    :type cl:float
    :initform 0.0)
   (acc_control_mode
    :reader acc_control_mode
    :initarg :acc_control_mode
    :type cl:integer
    :initform 0)
   (acc_loop_number
    :reader acc_loop_number
    :initarg :acc_loop_number
    :type cl:integer
    :initform 0)
   (acc_pedal_open_request
    :reader acc_pedal_open_request
    :initarg :acc_pedal_open_request
    :type cl:integer
    :initform 0)
   (brk_pedal_open_request
    :reader brk_pedal_open_request
    :initarg :brk_pedal_open_request
    :type cl:integer
    :initform 0)
   (steer_enable
    :reader steer_enable
    :initarg :steer_enable
    :type cl:integer
    :initform 0)
   (steer_angle_velocity
    :reader steer_angle_velocity
    :initarg :steer_angle_velocity
    :type cl:float
    :initform 0.0)
   (steer_angle
    :reader steer_angle
    :initarg :steer_angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass ChassisControl (<ChassisControl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChassisControl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChassisControl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs-msg:<ChassisControl> is deprecated: use common_msgs-msg:ChassisControl instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ChassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:header-val is deprecated.  Use common_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'acc_request-val :lambda-list '(m))
(cl:defmethod acc_request-val ((m <ChassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:acc_request-val is deprecated.  Use common_msgs-msg:acc_request instead.")
  (acc_request m))

(cl:ensure-generic-function 'acc_control_mode-val :lambda-list '(m))
(cl:defmethod acc_control_mode-val ((m <ChassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:acc_control_mode-val is deprecated.  Use common_msgs-msg:acc_control_mode instead.")
  (acc_control_mode m))

(cl:ensure-generic-function 'acc_loop_number-val :lambda-list '(m))
(cl:defmethod acc_loop_number-val ((m <ChassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:acc_loop_number-val is deprecated.  Use common_msgs-msg:acc_loop_number instead.")
  (acc_loop_number m))

(cl:ensure-generic-function 'acc_pedal_open_request-val :lambda-list '(m))
(cl:defmethod acc_pedal_open_request-val ((m <ChassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:acc_pedal_open_request-val is deprecated.  Use common_msgs-msg:acc_pedal_open_request instead.")
  (acc_pedal_open_request m))

(cl:ensure-generic-function 'brk_pedal_open_request-val :lambda-list '(m))
(cl:defmethod brk_pedal_open_request-val ((m <ChassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:brk_pedal_open_request-val is deprecated.  Use common_msgs-msg:brk_pedal_open_request instead.")
  (brk_pedal_open_request m))

(cl:ensure-generic-function 'steer_enable-val :lambda-list '(m))
(cl:defmethod steer_enable-val ((m <ChassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:steer_enable-val is deprecated.  Use common_msgs-msg:steer_enable instead.")
  (steer_enable m))

(cl:ensure-generic-function 'steer_angle_velocity-val :lambda-list '(m))
(cl:defmethod steer_angle_velocity-val ((m <ChassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:steer_angle_velocity-val is deprecated.  Use common_msgs-msg:steer_angle_velocity instead.")
  (steer_angle_velocity m))

(cl:ensure-generic-function 'steer_angle-val :lambda-list '(m))
(cl:defmethod steer_angle-val ((m <ChassisControl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:steer_angle-val is deprecated.  Use common_msgs-msg:steer_angle instead.")
  (steer_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChassisControl>) ostream)
  "Serializes a message object of type '<ChassisControl>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'acc_request))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'acc_control_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'acc_loop_number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'acc_pedal_open_request)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'brk_pedal_open_request)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'steer_enable)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'steer_angle_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'steer_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChassisControl>) istream)
  "Deserializes a message object of type '<ChassisControl>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_request) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acc_control_mode) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acc_loop_number) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acc_pedal_open_request) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'brk_pedal_open_request) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'steer_enable) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steer_angle_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steer_angle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChassisControl>)))
  "Returns string type for a message object of type '<ChassisControl>"
  "common_msgs/ChassisControl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChassisControl)))
  "Returns string type for a message object of type 'ChassisControl"
  "common_msgs/ChassisControl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChassisControl>)))
  "Returns md5sum for a message object of type '<ChassisControl>"
  "f4a7a2ade840279ee54283672cf94d29")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChassisControl)))
  "Returns md5sum for a message object of type 'ChassisControl"
  "f4a7a2ade840279ee54283672cf94d29")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChassisControl>)))
  "Returns full string definition for message of type '<ChassisControl>"
  (cl:format cl:nil "std_msgs/Header header~%~%float64 acc_request~%int32 acc_control_mode~%int32 acc_loop_number~%int32 acc_pedal_open_request~%int32 brk_pedal_open_request~%~%int32 steer_enable~%float64 steer_angle_velocity~%float64 steer_angle~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChassisControl)))
  "Returns full string definition for message of type 'ChassisControl"
  (cl:format cl:nil "std_msgs/Header header~%~%float64 acc_request~%int32 acc_control_mode~%int32 acc_loop_number~%int32 acc_pedal_open_request~%int32 brk_pedal_open_request~%~%int32 steer_enable~%float64 steer_angle_velocity~%float64 steer_angle~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChassisControl>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     4
     4
     4
     4
     4
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChassisControl>))
  "Converts a ROS message object to a list"
  (cl:list 'ChassisControl
    (cl:cons ':header (header msg))
    (cl:cons ':acc_request (acc_request msg))
    (cl:cons ':acc_control_mode (acc_control_mode msg))
    (cl:cons ':acc_loop_number (acc_loop_number msg))
    (cl:cons ':acc_pedal_open_request (acc_pedal_open_request msg))
    (cl:cons ':brk_pedal_open_request (brk_pedal_open_request msg))
    (cl:cons ':steer_enable (steer_enable msg))
    (cl:cons ':steer_angle_velocity (steer_angle_velocity msg))
    (cl:cons ':steer_angle (steer_angle msg))
))
