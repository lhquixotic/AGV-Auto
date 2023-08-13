; Auto-generated. Do not edit!


(cl:in-package common_msgs-msg)


;//! \htmlinclude ControlCommandStamped.msg.html

(cl:defclass <ControlCommandStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (cmd
    :reader cmd
    :initarg :cmd
    :type common_msgs-msg:ControlCommand
    :initform (cl:make-instance 'common_msgs-msg:ControlCommand)))
)

(cl:defclass ControlCommandStamped (<ControlCommandStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlCommandStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlCommandStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs-msg:<ControlCommandStamped> is deprecated: use common_msgs-msg:ControlCommandStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ControlCommandStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:header-val is deprecated.  Use common_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'cmd-val :lambda-list '(m))
(cl:defmethod cmd-val ((m <ControlCommandStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:cmd-val is deprecated.  Use common_msgs-msg:cmd instead.")
  (cmd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlCommandStamped>) ostream)
  "Serializes a message object of type '<ControlCommandStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cmd) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlCommandStamped>) istream)
  "Deserializes a message object of type '<ControlCommandStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cmd) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlCommandStamped>)))
  "Returns string type for a message object of type '<ControlCommandStamped>"
  "common_msgs/ControlCommandStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlCommandStamped)))
  "Returns string type for a message object of type 'ControlCommandStamped"
  "common_msgs/ControlCommandStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlCommandStamped>)))
  "Returns md5sum for a message object of type '<ControlCommandStamped>"
  "15a14ff20d13f2a22f6f3e667fbc7bc4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlCommandStamped)))
  "Returns md5sum for a message object of type 'ControlCommandStamped"
  "15a14ff20d13f2a22f6f3e667fbc7bc4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlCommandStamped>)))
  "Returns full string definition for message of type '<ControlCommandStamped>"
  (cl:format cl:nil "Header header~%ControlCommand cmd~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: common_msgs/ControlCommand~%int8 control_mode   # 1 for manual control~%float64 linear_velocity~%float64 linear_acceleration #m/s^2~%float64 steering_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlCommandStamped)))
  "Returns full string definition for message of type 'ControlCommandStamped"
  (cl:format cl:nil "Header header~%ControlCommand cmd~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: common_msgs/ControlCommand~%int8 control_mode   # 1 for manual control~%float64 linear_velocity~%float64 linear_acceleration #m/s^2~%float64 steering_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlCommandStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cmd))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlCommandStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlCommandStamped
    (cl:cons ':header (header msg))
    (cl:cons ':cmd (cmd msg))
))
