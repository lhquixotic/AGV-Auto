
"use strict";

let VirtualVehicleState = require('./VirtualVehicleState.js');
let ControlState = require('./ControlState.js');
let ControlCommand = require('./ControlCommand.js');
let Trigger = require('./Trigger.js');
let ChassisControl = require('./ChassisControl.js');
let ChassisState = require('./ChassisState.js');
let MagneticSignal = require('./MagneticSignal.js');
let SerialMsg = require('./SerialMsg.js');
let ControlCommandStamped = require('./ControlCommandStamped.js');
let GpsInfo = require('./GpsInfo.js');
let RemoteControl = require('./RemoteControl.js');

module.exports = {
  VirtualVehicleState: VirtualVehicleState,
  ControlState: ControlState,
  ControlCommand: ControlCommand,
  Trigger: Trigger,
  ChassisControl: ChassisControl,
  ChassisState: ChassisState,
  MagneticSignal: MagneticSignal,
  SerialMsg: SerialMsg,
  ControlCommandStamped: ControlCommandStamped,
  GpsInfo: GpsInfo,
  RemoteControl: RemoteControl,
};
