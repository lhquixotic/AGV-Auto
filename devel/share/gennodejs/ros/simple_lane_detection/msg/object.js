// Auto-generated. Do not edit!

// (in-package simple_lane_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class object {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.left_cx_down = null;
      this.left_cx_upper = null;
      this.left_cy_down = null;
      this.letf_cy_upper = null;
      this.mid_cx_down = null;
      this.mid_cx_upper = null;
      this.mid_cy_down = null;
      this.mid_cy_upper = null;
      this.rig_cx_down = null;
      this.rig_cx_upper = null;
      this.rig_cy_down = null;
      this.rig_cy_upper = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('left_cx_down')) {
        this.left_cx_down = initObj.left_cx_down
      }
      else {
        this.left_cx_down = 0.0;
      }
      if (initObj.hasOwnProperty('left_cx_upper')) {
        this.left_cx_upper = initObj.left_cx_upper
      }
      else {
        this.left_cx_upper = 0.0;
      }
      if (initObj.hasOwnProperty('left_cy_down')) {
        this.left_cy_down = initObj.left_cy_down
      }
      else {
        this.left_cy_down = 0.0;
      }
      if (initObj.hasOwnProperty('letf_cy_upper')) {
        this.letf_cy_upper = initObj.letf_cy_upper
      }
      else {
        this.letf_cy_upper = 0.0;
      }
      if (initObj.hasOwnProperty('mid_cx_down')) {
        this.mid_cx_down = initObj.mid_cx_down
      }
      else {
        this.mid_cx_down = 0.0;
      }
      if (initObj.hasOwnProperty('mid_cx_upper')) {
        this.mid_cx_upper = initObj.mid_cx_upper
      }
      else {
        this.mid_cx_upper = 0.0;
      }
      if (initObj.hasOwnProperty('mid_cy_down')) {
        this.mid_cy_down = initObj.mid_cy_down
      }
      else {
        this.mid_cy_down = 0.0;
      }
      if (initObj.hasOwnProperty('mid_cy_upper')) {
        this.mid_cy_upper = initObj.mid_cy_upper
      }
      else {
        this.mid_cy_upper = 0.0;
      }
      if (initObj.hasOwnProperty('rig_cx_down')) {
        this.rig_cx_down = initObj.rig_cx_down
      }
      else {
        this.rig_cx_down = 0.0;
      }
      if (initObj.hasOwnProperty('rig_cx_upper')) {
        this.rig_cx_upper = initObj.rig_cx_upper
      }
      else {
        this.rig_cx_upper = 0.0;
      }
      if (initObj.hasOwnProperty('rig_cy_down')) {
        this.rig_cy_down = initObj.rig_cy_down
      }
      else {
        this.rig_cy_down = 0.0;
      }
      if (initObj.hasOwnProperty('rig_cy_upper')) {
        this.rig_cy_upper = initObj.rig_cy_upper
      }
      else {
        this.rig_cy_upper = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type object
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [left_cx_down]
    bufferOffset = _serializer.float32(obj.left_cx_down, buffer, bufferOffset);
    // Serialize message field [left_cx_upper]
    bufferOffset = _serializer.float32(obj.left_cx_upper, buffer, bufferOffset);
    // Serialize message field [left_cy_down]
    bufferOffset = _serializer.float32(obj.left_cy_down, buffer, bufferOffset);
    // Serialize message field [letf_cy_upper]
    bufferOffset = _serializer.float32(obj.letf_cy_upper, buffer, bufferOffset);
    // Serialize message field [mid_cx_down]
    bufferOffset = _serializer.float32(obj.mid_cx_down, buffer, bufferOffset);
    // Serialize message field [mid_cx_upper]
    bufferOffset = _serializer.float32(obj.mid_cx_upper, buffer, bufferOffset);
    // Serialize message field [mid_cy_down]
    bufferOffset = _serializer.float32(obj.mid_cy_down, buffer, bufferOffset);
    // Serialize message field [mid_cy_upper]
    bufferOffset = _serializer.float32(obj.mid_cy_upper, buffer, bufferOffset);
    // Serialize message field [rig_cx_down]
    bufferOffset = _serializer.float32(obj.rig_cx_down, buffer, bufferOffset);
    // Serialize message field [rig_cx_upper]
    bufferOffset = _serializer.float32(obj.rig_cx_upper, buffer, bufferOffset);
    // Serialize message field [rig_cy_down]
    bufferOffset = _serializer.float32(obj.rig_cy_down, buffer, bufferOffset);
    // Serialize message field [rig_cy_upper]
    bufferOffset = _serializer.float32(obj.rig_cy_upper, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type object
    let len;
    let data = new object(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [left_cx_down]
    data.left_cx_down = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_cx_upper]
    data.left_cx_upper = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_cy_down]
    data.left_cy_down = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [letf_cy_upper]
    data.letf_cy_upper = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mid_cx_down]
    data.mid_cx_down = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mid_cx_upper]
    data.mid_cx_upper = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mid_cy_down]
    data.mid_cy_down = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mid_cy_upper]
    data.mid_cy_upper = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rig_cx_down]
    data.rig_cx_down = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rig_cx_upper]
    data.rig_cx_upper = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rig_cy_down]
    data.rig_cy_down = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rig_cy_upper]
    data.rig_cy_upper = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'simple_lane_detection/object';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '10f6e7b97734158810c589b4cdb3ff51';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new object(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.left_cx_down !== undefined) {
      resolved.left_cx_down = msg.left_cx_down;
    }
    else {
      resolved.left_cx_down = 0.0
    }

    if (msg.left_cx_upper !== undefined) {
      resolved.left_cx_upper = msg.left_cx_upper;
    }
    else {
      resolved.left_cx_upper = 0.0
    }

    if (msg.left_cy_down !== undefined) {
      resolved.left_cy_down = msg.left_cy_down;
    }
    else {
      resolved.left_cy_down = 0.0
    }

    if (msg.letf_cy_upper !== undefined) {
      resolved.letf_cy_upper = msg.letf_cy_upper;
    }
    else {
      resolved.letf_cy_upper = 0.0
    }

    if (msg.mid_cx_down !== undefined) {
      resolved.mid_cx_down = msg.mid_cx_down;
    }
    else {
      resolved.mid_cx_down = 0.0
    }

    if (msg.mid_cx_upper !== undefined) {
      resolved.mid_cx_upper = msg.mid_cx_upper;
    }
    else {
      resolved.mid_cx_upper = 0.0
    }

    if (msg.mid_cy_down !== undefined) {
      resolved.mid_cy_down = msg.mid_cy_down;
    }
    else {
      resolved.mid_cy_down = 0.0
    }

    if (msg.mid_cy_upper !== undefined) {
      resolved.mid_cy_upper = msg.mid_cy_upper;
    }
    else {
      resolved.mid_cy_upper = 0.0
    }

    if (msg.rig_cx_down !== undefined) {
      resolved.rig_cx_down = msg.rig_cx_down;
    }
    else {
      resolved.rig_cx_down = 0.0
    }

    if (msg.rig_cx_upper !== undefined) {
      resolved.rig_cx_upper = msg.rig_cx_upper;
    }
    else {
      resolved.rig_cx_upper = 0.0
    }

    if (msg.rig_cy_down !== undefined) {
      resolved.rig_cy_down = msg.rig_cy_down;
    }
    else {
      resolved.rig_cy_down = 0.0
    }

    if (msg.rig_cy_upper !== undefined) {
      resolved.rig_cy_upper = msg.rig_cy_upper;
    }
    else {
      resolved.rig_cy_upper = 0.0
    }

    return resolved;
    }
};

module.exports = object;
