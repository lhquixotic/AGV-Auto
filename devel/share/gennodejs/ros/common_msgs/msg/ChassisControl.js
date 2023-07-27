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

class ChassisControl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.acc_request = null;
      this.acc_control_mode = null;
      this.acc_loop_number = null;
      this.acc_pedal_open_request = null;
      this.brk_pedal_open_request = null;
      this.steer_enable = null;
      this.steer_angle_velocity = null;
      this.steer_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('acc_request')) {
        this.acc_request = initObj.acc_request
      }
      else {
        this.acc_request = 0.0;
      }
      if (initObj.hasOwnProperty('acc_control_mode')) {
        this.acc_control_mode = initObj.acc_control_mode
      }
      else {
        this.acc_control_mode = 0;
      }
      if (initObj.hasOwnProperty('acc_loop_number')) {
        this.acc_loop_number = initObj.acc_loop_number
      }
      else {
        this.acc_loop_number = 0;
      }
      if (initObj.hasOwnProperty('acc_pedal_open_request')) {
        this.acc_pedal_open_request = initObj.acc_pedal_open_request
      }
      else {
        this.acc_pedal_open_request = 0;
      }
      if (initObj.hasOwnProperty('brk_pedal_open_request')) {
        this.brk_pedal_open_request = initObj.brk_pedal_open_request
      }
      else {
        this.brk_pedal_open_request = 0;
      }
      if (initObj.hasOwnProperty('steer_enable')) {
        this.steer_enable = initObj.steer_enable
      }
      else {
        this.steer_enable = 0;
      }
      if (initObj.hasOwnProperty('steer_angle_velocity')) {
        this.steer_angle_velocity = initObj.steer_angle_velocity
      }
      else {
        this.steer_angle_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('steer_angle')) {
        this.steer_angle = initObj.steer_angle
      }
      else {
        this.steer_angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChassisControl
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [acc_request]
    bufferOffset = _serializer.float64(obj.acc_request, buffer, bufferOffset);
    // Serialize message field [acc_control_mode]
    bufferOffset = _serializer.int32(obj.acc_control_mode, buffer, bufferOffset);
    // Serialize message field [acc_loop_number]
    bufferOffset = _serializer.int32(obj.acc_loop_number, buffer, bufferOffset);
    // Serialize message field [acc_pedal_open_request]
    bufferOffset = _serializer.int32(obj.acc_pedal_open_request, buffer, bufferOffset);
    // Serialize message field [brk_pedal_open_request]
    bufferOffset = _serializer.int32(obj.brk_pedal_open_request, buffer, bufferOffset);
    // Serialize message field [steer_enable]
    bufferOffset = _serializer.int32(obj.steer_enable, buffer, bufferOffset);
    // Serialize message field [steer_angle_velocity]
    bufferOffset = _serializer.float64(obj.steer_angle_velocity, buffer, bufferOffset);
    // Serialize message field [steer_angle]
    bufferOffset = _serializer.float64(obj.steer_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChassisControl
    let len;
    let data = new ChassisControl(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [acc_request]
    data.acc_request = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [acc_control_mode]
    data.acc_control_mode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [acc_loop_number]
    data.acc_loop_number = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [acc_pedal_open_request]
    data.acc_pedal_open_request = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [brk_pedal_open_request]
    data.brk_pedal_open_request = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [steer_enable]
    data.steer_enable = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [steer_angle_velocity]
    data.steer_angle_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [steer_angle]
    data.steer_angle = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common_msgs/ChassisControl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f4a7a2ade840279ee54283672cf94d29';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    float64 acc_request
    int32 acc_control_mode
    int32 acc_loop_number
    int32 acc_pedal_open_request
    int32 brk_pedal_open_request
    
    int32 steer_enable
    float64 steer_angle_velocity
    float64 steer_angle
    
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
    const resolved = new ChassisControl(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.acc_request !== undefined) {
      resolved.acc_request = msg.acc_request;
    }
    else {
      resolved.acc_request = 0.0
    }

    if (msg.acc_control_mode !== undefined) {
      resolved.acc_control_mode = msg.acc_control_mode;
    }
    else {
      resolved.acc_control_mode = 0
    }

    if (msg.acc_loop_number !== undefined) {
      resolved.acc_loop_number = msg.acc_loop_number;
    }
    else {
      resolved.acc_loop_number = 0
    }

    if (msg.acc_pedal_open_request !== undefined) {
      resolved.acc_pedal_open_request = msg.acc_pedal_open_request;
    }
    else {
      resolved.acc_pedal_open_request = 0
    }

    if (msg.brk_pedal_open_request !== undefined) {
      resolved.brk_pedal_open_request = msg.brk_pedal_open_request;
    }
    else {
      resolved.brk_pedal_open_request = 0
    }

    if (msg.steer_enable !== undefined) {
      resolved.steer_enable = msg.steer_enable;
    }
    else {
      resolved.steer_enable = 0
    }

    if (msg.steer_angle_velocity !== undefined) {
      resolved.steer_angle_velocity = msg.steer_angle_velocity;
    }
    else {
      resolved.steer_angle_velocity = 0.0
    }

    if (msg.steer_angle !== undefined) {
      resolved.steer_angle = msg.steer_angle;
    }
    else {
      resolved.steer_angle = 0.0
    }

    return resolved;
    }
};

module.exports = ChassisControl;
