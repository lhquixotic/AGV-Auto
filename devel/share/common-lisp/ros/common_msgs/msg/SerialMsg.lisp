; Auto-generated. Do not edit!


(cl:in-package common_msgs-msg)


;//! \htmlinclude SerialMsg.msg.html

(cl:defclass <SerialMsg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 256 :element-type 'cl:fixnum :initial-element 0))
   (length
    :reader length
    :initarg :length
    :type cl:integer
    :initform 0))
)

(cl:defclass SerialMsg (<SerialMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SerialMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SerialMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs-msg:<SerialMsg> is deprecated: use common_msgs-msg:SerialMsg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SerialMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:header-val is deprecated.  Use common_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SerialMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:data-val is deprecated.  Use common_msgs-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'length-val :lambda-list '(m))
(cl:defmethod length-val ((m <SerialMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:length-val is deprecated.  Use common_msgs-msg:length instead.")
  (length m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SerialMsg>) ostream)
  "Serializes a message object of type '<SerialMsg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'data))
  (cl:let* ((signed (cl:slot-value msg 'length)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SerialMsg>) istream)
  "Deserializes a message object of type '<SerialMsg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 256))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 256)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'length) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SerialMsg>)))
  "Returns string type for a message object of type '<SerialMsg>"
  "common_msgs/SerialMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SerialMsg)))
  "Returns string type for a message object of type 'SerialMsg"
  "common_msgs/SerialMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SerialMsg>)))
  "Returns md5sum for a message object of type '<SerialMsg>"
  "04e569ccde7b2c8a16c1d0048b38a73e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SerialMsg)))
  "Returns md5sum for a message object of type 'SerialMsg"
  "04e569ccde7b2c8a16c1d0048b38a73e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SerialMsg>)))
  "Returns full string definition for message of type '<SerialMsg>"
  (cl:format cl:nil "std_msgs/Header header~%~%uint8[256] data~%int32 length~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SerialMsg)))
  "Returns full string definition for message of type 'SerialMsg"
  (cl:format cl:nil "std_msgs/Header header~%~%uint8[256] data~%int32 length~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SerialMsg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SerialMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'SerialMsg
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
    (cl:cons ':length (length msg))
))
