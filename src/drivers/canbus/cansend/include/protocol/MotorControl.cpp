#include "MotorControl.h" 
MotorControl::MotorControl(){
  id_ = 0x0f3b0101; //0f3b0101
  dlc_ = 8;
  is_extended_ = 1;
  is_error_ = 0;
  is_rtr_ = 0;
  Reset();
  for(int i=0;i<dlc_;i++) data_[i] = 0;
}
void MotorControl::Reset(){
  Motor1SpeedCon_=0;
  Motor2SpeedCon_=0;
}
void MotorControl::Update(uint8_t *data){
  Set_p_Motor1SpeedCon(Motor1SpeedCon_);
  Set_p_Motor2SpeedCon(Motor2SpeedCon_);
  for(int i=0;i<dlc_;i++) data[i] = data_[i];
}
/******************
signalname: Motor1SpeedCon;
signalclass: int16;
StartBit: 8;
SignalSize: 16;
ByteOrder: BigEndian;
Factor: 1;
Offset: 0;
Minimum: -32768;
Maximum: 32767;
******************/
void MotorControl::SetMotor1SpeedCon(double Motor1SpeedCon){
  Motor1SpeedCon_=Motor1SpeedCon;
}
void MotorControl::Set_p_Motor1SpeedCon(double Motor1SpeedCon){
  Motor1SpeedCon=BoundedValue(-32768.000000,32767.000000,Motor1SpeedCon);
  int x = (Motor1SpeedCon - 0.000000) / 1.000000;
  uint8_t x0 = x & RANG_MASK_1_L[7];
  x >>= 8;
  SetByte(data_ + 1,0,8,x0);
  uint8_t x1 = x & RANG_MASK_1_L[7];
  x >>= 8;
  SetByte(data_ + 0,0,8,x1);
}
/******************
signalname: Motor2SpeedCon;
signalclass: int16;
StartBit: 40;
SignalSize: 16;
ByteOrder: BigEndian;
Factor: 1;
Offset: 0;
Minimum: -32768;
Maximum: 32767;
******************/
void MotorControl::SetMotor2SpeedCon(double Motor2SpeedCon){
  Motor2SpeedCon_=Motor2SpeedCon;
}
void MotorControl::Set_p_Motor2SpeedCon(double Motor2SpeedCon){
  Motor2SpeedCon=BoundedValue(-32768.000000,32767.000000,Motor2SpeedCon);
  int x = (Motor2SpeedCon - 0.000000) / 1.000000;
  uint8_t x0 = x & RANG_MASK_1_L[7];
  x >>= 8;
  SetByte(data_ + 5,0,8,x0);
  uint8_t x1 = x & RANG_MASK_1_L[7];
  x >>= 8;
  SetByte(data_ + 4,0,8,x1);
}
