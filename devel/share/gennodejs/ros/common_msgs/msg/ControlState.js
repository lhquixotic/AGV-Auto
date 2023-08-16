// Auto-generated. Do not edit!

// (in-package common_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ControlState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lateral_error = null;
      this.heading_error = null;
      this.dot_lateral_error = null;
      this.dot_heading_error = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('lateral_error')) {
        this.lateral_error = initObj.lateral_error
      }
      else {
        this.lateral_error = 0.0;
      }
      if (initObj.hasOwnProperty('heading_error')) {
        this.heading_error = initObj.heading_error
      }
      else {
        this.heading_error = 0.0;
      }
      if (initObj.hasOwnProperty('dot_lateral_error')) {
        this.dot_lateral_error = initObj.dot_lateral_error
      }
      else {
        this.dot_lateral_error = 0.0;
      }
      if (initObj.hasOwnProperty('dot_heading_error')) {
        this.dot_heading_error = initObj.dot_heading_error
      }
      else {
        this.dot_heading_error = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lateral_error]
    bufferOffset = _serializer.float64(obj.lateral_error, buffer, bufferOffset);
    // Serialize message field [heading_error]
    bufferOffset = _serializer.float64(obj.heading_error, buffer, bufferOffset);
    // Serialize message field [dot_lateral_error]
    bufferOffset = _serializer.float64(obj.dot_lateral_error, buffer, bufferOffset);
    // Serialize message field [dot_heading_error]
    bufferOffset = _serializer.float64(obj.dot_heading_error, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlState
    let len;
    let data = new ControlState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lateral_error]
    data.lateral_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [heading_error]
    data.heading_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dot_lateral_error]
    data.dot_lateral_error = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [dot_heading_error]
    data.dot_heading_error = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common_msgs/ControlState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '482c5c5ba4aa1b0cca755e883ff62627';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    # lateral error 
    float64 lateral_error
    
    # heading error
    float64 heading_error
    
    # dot lateral error
    float64 dot_lateral_error
    
    # dot heading error
    float64 dot_heading_error
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.lateral_error !== undefined) {
      resolved.lateral_error = msg.lateral_error;
    }
    else {
      resolved.lateral_error = 0.0
    }

    if (msg.heading_error !== undefined) {
      resolved.heading_error = msg.heading_error;
    }
    else {
      resolved.heading_error = 0.0
    }

    if (msg.dot_lateral_error !== undefined) {
      resolved.dot_lateral_error = msg.dot_lateral_error;
    }
    else {
      resolved.dot_lateral_error = 0.0
    }

    if (msg.dot_heading_error !== undefined) {
      resolved.dot_heading_error = msg.dot_heading_error;
    }
    else {
      resolved.dot_heading_error = 0.0
    }

    return resolved;
    }
};

module.exports = ControlState;
