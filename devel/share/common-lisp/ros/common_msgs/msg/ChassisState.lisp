; Auto-generated. Do not edit!


(cl:in-package common_msgs-msg)


;//! \htmlinclude ChassisState.msg.html

(cl:defclass <ChassisState> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (real_acc_pedal
    :reader real_acc_pedal
    :initarg :real_acc_pedal
    :type cl:fixnum
    :initform 0)
   (real_brake_pedal
    :reader real_brake_pedal
    :initarg :real_brake_pedal
    :type cl:fixnum
    :initform 0)
   (real_steer_angle_left
    :reader real_steer_angle_left
    :initarg :real_steer_angle_left
    :type cl:float
    :initform 0.0)
   (real_steer_angle_right
    :reader real_steer_angle_right
    :initarg :real_steer_angle_right
    :type cl:float
    :initform 0.0)
   (vehicle_lon_acceleration
    :reader vehicle_lon_acceleration
    :initarg :vehicle_lon_acceleration
    :type cl:float
    :initform 0.0))
)

(cl:defclass ChassisState (<ChassisState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChassisState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChassisState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs-msg:<ChassisState> is deprecated: use common_msgs-msg:ChassisState instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ChassisState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:header-val is deprecated.  Use common_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'real_acc_pedal-val :lambda-list '(m))
(cl:defmethod real_acc_pedal-val ((m <ChassisState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:real_acc_pedal-val is deprecated.  Use common_msgs-msg:real_acc_pedal instead.")
  (real_acc_pedal m))

(cl:ensure-generic-function 'real_brake_pedal-val :lambda-list '(m))
(cl:defmethod real_brake_pedal-val ((m <ChassisState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:real_brake_pedal-val is deprecated.  Use common_msgs-msg:real_brake_pedal instead.")
  (real_brake_pedal m))

(cl:ensure-generic-function 'real_steer_angle_left-val :lambda-list '(m))
(cl:defmethod real_steer_angle_left-val ((m <ChassisState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:real_steer_angle_left-val is deprecated.  Use common_msgs-msg:real_steer_angle_left instead.")
  (real_steer_angle_left m))

(cl:ensure-generic-function 'real_steer_angle_right-val :lambda-list '(m))
(cl:defmethod real_steer_angle_right-val ((m <ChassisState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:real_steer_angle_right-val is deprecated.  Use common_msgs-msg:real_steer_angle_right instead.")
  (real_steer_angle_right m))

(cl:ensure-generic-function 'vehicle_lon_acceleration-val :lambda-list '(m))
(cl:defmethod vehicle_lon_acceleration-val ((m <ChassisState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:vehicle_lon_acceleration-val is deprecated.  Use common_msgs-msg:vehicle_lon_acceleration instead.")
  (vehicle_lon_acceleration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChassisState>) ostream)
  "Serializes a message object of type '<ChassisState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'real_acc_pedal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'real_brake_pedal)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'real_steer_angle_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'real_steer_angle_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vehicle_lon_acceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChassisState>) istream)
  "Deserializes a message object of type '<ChassisState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'real_acc_pedal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'real_brake_pedal)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'real_steer_angle_left) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'real_steer_angle_right) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vehicle_lon_acceleration) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChassisState>)))
  "Returns string type for a message object of type '<ChassisState>"
  "common_msgs/ChassisState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChassisState)))
  "Returns string type for a message object of type 'ChassisState"
  "common_msgs/ChassisState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChassisState>)))
  "Returns md5sum for a message object of type '<ChassisState>"
  "250f4d938e1a97be304a5f49b807d794")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChassisState)))
  "Returns md5sum for a message object of type 'ChassisState"
  "250f4d938e1a97be304a5f49b807d794")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChassisState>)))
  "Returns full string definition for message of type '<ChassisState>"
  (cl:format cl:nil "std_msgs/Header header~%~%# real acc pedal value~%uint8 real_acc_pedal~%~%# real brake pedal value~%uint8 real_brake_pedal~%~%# real steering wheel angle~%float64 real_steer_angle_left~%float64 real_steer_angle_right~%~%# vehicle longitudinal acceleration~%float64 vehicle_lon_acceleration~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChassisState)))
  "Returns full string definition for message of type 'ChassisState"
  (cl:format cl:nil "std_msgs/Header header~%~%# real acc pedal value~%uint8 real_acc_pedal~%~%# real brake pedal value~%uint8 real_brake_pedal~%~%# real steering wheel angle~%float64 real_steer_angle_left~%float64 real_steer_angle_right~%~%# vehicle longitudinal acceleration~%float64 vehicle_lon_acceleration~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChassisState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChassisState>))
  "Converts a ROS message object to a list"
  (cl:list 'ChassisState
    (cl:cons ':header (header msg))
    (cl:cons ':real_acc_pedal (real_acc_pedal msg))
    (cl:cons ':real_brake_pedal (real_brake_pedal msg))
    (cl:cons ':real_steer_angle_left (real_steer_angle_left msg))
    (cl:cons ':real_steer_angle_right (real_steer_angle_right msg))
    (cl:cons ':vehicle_lon_acceleration (vehicle_lon_acceleration msg))
))
