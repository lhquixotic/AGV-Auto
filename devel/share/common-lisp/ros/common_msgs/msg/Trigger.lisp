; Auto-generated. Do not edit!


(cl:in-package common_msgs-msg)


;//! \htmlinclude Trigger.msg.html

(cl:defclass <Trigger> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (trigger
    :reader trigger
    :initarg :trigger
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Trigger (<Trigger>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Trigger>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Trigger)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs-msg:<Trigger> is deprecated: use common_msgs-msg:Trigger instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Trigger>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:header-val is deprecated.  Use common_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'trigger-val :lambda-list '(m))
(cl:defmethod trigger-val ((m <Trigger>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:trigger-val is deprecated.  Use common_msgs-msg:trigger instead.")
  (trigger m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Trigger>) ostream)
  "Serializes a message object of type '<Trigger>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'trigger) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Trigger>) istream)
  "Deserializes a message object of type '<Trigger>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'trigger) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Trigger>)))
  "Returns string type for a message object of type '<Trigger>"
  "common_msgs/Trigger")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Trigger)))
  "Returns string type for a message object of type 'Trigger"
  "common_msgs/Trigger")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Trigger>)))
  "Returns md5sum for a message object of type '<Trigger>"
  "cb381b11b4dbec913c041cb0ec39302e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Trigger)))
  "Returns md5sum for a message object of type 'Trigger"
  "cb381b11b4dbec913c041cb0ec39302e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Trigger>)))
  "Returns full string definition for message of type '<Trigger>"
  (cl:format cl:nil "std_msgs/Header header~%~%# trigger signal~%bool trigger~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Trigger)))
  "Returns full string definition for message of type 'Trigger"
  (cl:format cl:nil "std_msgs/Header header~%~%# trigger signal~%bool trigger~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Trigger>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Trigger>))
  "Converts a ROS message object to a list"
  (cl:list 'Trigger
    (cl:cons ':header (header msg))
    (cl:cons ':trigger (trigger msg))
))
