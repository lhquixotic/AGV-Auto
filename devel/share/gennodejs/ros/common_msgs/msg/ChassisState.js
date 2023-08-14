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

class ChassisState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.real_acc_pedal = null;
      this.real_brake_pedal = null;
      this.real_steer_angle_left = null;
      this.real_steer_angle_right = null;
      this.vehicle_lon_acceleration = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('real_acc_pedal')) {
        this.real_acc_pedal = initObj.real_acc_pedal
      }
      else {
        this.real_acc_pedal = 0;
      }
      if (initObj.hasOwnProperty('real_brake_pedal')) {
        this.real_brake_pedal = initObj.real_brake_pedal
      }
      else {
        this.real_brake_pedal = 0;
      }
      if (initObj.hasOwnProperty('real_steer_angle_left')) {
        this.real_steer_angle_left = initObj.real_steer_angle_left
      }
      else {
        this.real_steer_angle_left = 0.0;
      }
      if (initObj.hasOwnProperty('real_steer_angle_right')) {
        this.real_steer_angle_right = initObj.real_steer_angle_right
      }
      else {
        this.real_steer_angle_right = 0.0;
      }
      if (initObj.hasOwnProperty('vehicle_lon_acceleration')) {
        this.vehicle_lon_acceleration = initObj.vehicle_lon_acceleration
      }
      else {
        this.vehicle_lon_acceleration = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChassisState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [real_acc_pedal]
    bufferOffset = _serializer.uint8(obj.real_acc_pedal, buffer, bufferOffset);
    // Serialize message field [real_brake_pedal]
    bufferOffset = _serializer.uint8(obj.real_brake_pedal, buffer, bufferOffset);
    // Serialize message field [real_steer_angle_left]
    bufferOffset = _serializer.float64(obj.real_steer_angle_left, buffer, bufferOffset);
    // Serialize message field [real_steer_angle_right]
    bufferOffset = _serializer.float64(obj.real_steer_angle_right, buffer, bufferOffset);
    // Serialize message field [vehicle_lon_acceleration]
    bufferOffset = _serializer.float64(obj.vehicle_lon_acceleration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChassisState
    let len;
    let data = new ChassisState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [real_acc_pedal]
    data.real_acc_pedal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [real_brake_pedal]
    data.real_brake_pedal = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [real_steer_angle_left]
    data.real_steer_angle_left = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [real_steer_angle_right]
    data.real_steer_angle_right = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vehicle_lon_acceleration]
    data.vehicle_lon_acceleration = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'common_msgs/ChassisState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '250f4d938e1a97be304a5f49b807d794';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    
    # real acc pedal value
    uint8 real_acc_pedal
    
    # real brake pedal value
    uint8 real_brake_pedal
    
    # real steering wheel angle
    float64 real_steer_angle_left
    float64 real_steer_angle_right
    
    # vehicle longitudinal acceleration
    float64 vehicle_lon_acceleration
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
    const resolved = new ChassisState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.real_acc_pedal !== undefined) {
      resolved.real_acc_pedal = msg.real_acc_pedal;
    }
    else {
      resolved.real_acc_pedal = 0
    }

    if (msg.real_brake_pedal !== undefined) {
      resolved.real_brake_pedal = msg.real_brake_pedal;
    }
    else {
      resolved.real_brake_pedal = 0
    }

    if (msg.real_steer_angle_left !== undefined) {
      resolved.real_steer_angle_left = msg.real_steer_angle_left;
    }
    else {
      resolved.real_steer_angle_left = 0.0
    }

    if (msg.real_steer_angle_right !== undefined) {
      resolved.real_steer_angle_right = msg.real_steer_angle_right;
    }
    else {
      resolved.real_steer_angle_right = 0.0
    }

    if (msg.vehicle_lon_acceleration !== undefined) {
      resolved.vehicle_lon_acceleration = msg.vehicle_lon_acceleration;
    }
    else {
      resolved.vehicle_lon_acceleration = 0.0
    }

    return resolved;
    }
};

module.exports = ChassisState;
