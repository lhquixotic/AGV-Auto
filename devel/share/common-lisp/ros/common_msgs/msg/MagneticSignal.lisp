; Auto-generated. Do not edit!


(cl:in-package common_msgs-msg)


;//! \htmlinclude MagneticSignal.msg.html

(cl:defclass <MagneticSignal> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (intensity
    :reader intensity
    :initarg :intensity
    :type cl:integer
    :initform 0)
   (current_loc
    :reader current_loc
    :initarg :current_loc
    :type cl:integer
    :initform 0)
   (middle_loc
    :reader middle_loc
    :initarg :middle_loc
    :type cl:integer
    :initform 0))
)

(cl:defclass MagneticSignal (<MagneticSignal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MagneticSignal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MagneticSignal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name common_msgs-msg:<MagneticSignal> is deprecated: use common_msgs-msg:MagneticSignal instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MagneticSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:header-val is deprecated.  Use common_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'intensity-val :lambda-list '(m))
(cl:defmethod intensity-val ((m <MagneticSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:intensity-val is deprecated.  Use common_msgs-msg:intensity instead.")
  (intensity m))

(cl:ensure-generic-function 'current_loc-val :lambda-list '(m))
(cl:defmethod current_loc-val ((m <MagneticSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:current_loc-val is deprecated.  Use common_msgs-msg:current_loc instead.")
  (current_loc m))

(cl:ensure-generic-function 'middle_loc-val :lambda-list '(m))
(cl:defmethod middle_loc-val ((m <MagneticSignal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader common_msgs-msg:middle_loc-val is deprecated.  Use common_msgs-msg:middle_loc instead.")
  (middle_loc m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MagneticSignal>) ostream)
  "Serializes a message object of type '<MagneticSignal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'intensity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'current_loc)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'middle_loc)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MagneticSignal>) istream)
  "Deserializes a message object of type '<MagneticSignal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'intensity) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current_loc) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'middle_loc) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MagneticSignal>)))
  "Returns string type for a message object of type '<MagneticSignal>"
  "common_msgs/MagneticSignal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MagneticSignal)))
  "Returns string type for a message object of type 'MagneticSignal"
  "common_msgs/MagneticSignal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MagneticSignal>)))
  "Returns md5sum for a message object of type '<MagneticSignal>"
  "2ef1a2bcbce072ce84a5a2982b030642")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MagneticSignal)))
  "Returns md5sum for a message object of type 'MagneticSignal"
  "2ef1a2bcbce072ce84a5a2982b030642")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MagneticSignal>)))
  "Returns full string definition for message of type '<MagneticSignal>"
  (cl:format cl:nil "std_msgs/Header header~%~%int32 intensity~%int32 current_loc~%int32 middle_loc~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MagneticSignal)))
  "Returns full string definition for message of type 'MagneticSignal"
  (cl:format cl:nil "std_msgs/Header header~%~%int32 intensity~%int32 current_loc~%int32 middle_loc~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MagneticSignal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MagneticSignal>))
  "Converts a ROS message object to a list"
  (cl:list 'MagneticSignal
    (cl:cons ':header (header msg))
    (cl:cons ':intensity (intensity msg))
    (cl:cons ':current_loc (current_loc msg))
    (cl:cons ':middle_loc (middle_loc msg))
))
