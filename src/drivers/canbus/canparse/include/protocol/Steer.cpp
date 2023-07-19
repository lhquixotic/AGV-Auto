#include "Steer.h"
Steer::Steer(){
  id_ = 0x02;
  dlc_ = 8;
  is_extended_ = 0;
  is_error_ = 0;
  is_rtr_ = 0;
  for(int i=0;i<dlc_;i++) data_[i] = 0;
  SteerPositionH_=0;
  SteerPositionL_=0;

  Hdata_recved = false;
  Ldata_recved = false;
}
void Steer::Reset(){
  SteerPositionH_=0;
  SteerPositionL_=0;
}
void Steer::Update(uint8_t *data){
  for(int i=0;i<dlc_;i++) data_[i] = data[i];
  UpdateSteerPositionH();
  UpdateSteerPositionL();
  UpdateSteerPosition();
}

/******************
signalname: SteerPositionH;
signalclass: uint16;
StartBit: 24;
SignalSize: 16;
ByteOrder: LittleEndian;
Factor: 1;
Offset: 0;
Minimum: 0;
Maximum: 65535;
******************/
void Steer::UpdateSteerPositionH(){
  int16_t d0 = GetByte(data_ + 0,0,8);
  int16_t d1 = GetByte(data_ + 1,0,8);
  int16_t d2 = GetByte(data_ + 2,0,8);
  if((d0==1)&&(d1==3)&&(d2==2)){
    if(!Hdata_recved) Hdata_recved = true;
    int32_t x0 = GetByte(data_ + 3,0,8);
    int32_t x1 = GetByte(data_ + 4,0,8);
    x0<<=8;
    x1<<=0;
    x0|=x1;
    double ret = x0 * 1.0000000000 + 0.0000000000;
    SteerPositionH_ = ret;
  }
}
double Steer::SteerPositionH(){
  return SteerPositionH_;
}

/******************
signalname: SteerPositionL;
signalclass: uint16;
StartBit: 24;
SignalSize: 16;
ByteOrder: LittleEndian;
Factor: 1;
Offset: 0;
Minimum: 0;
Maximum: 65535;
******************/
void Steer::UpdateSteerPositionL(){
  int16_t d0 = GetByte(data_ + 0,0,8);
  int16_t d1 = GetByte(data_ + 1,0,8);
  int16_t d2 = GetByte(data_ + 2,0,8);
  if((d0==1)&&(d1==3)&&(d2==4)){
    if(!Ldata_recved) Ldata_recved = true;
    int32_t x0 = GetByte(data_ + 3,0,8);
    int32_t x1 = GetByte(data_ + 4,0,8);
    x0<<=8;
    x1<<=0;
    x0|=x1;
    double ret = x0 * 1.0000000000 + 0.0000000000;
    SteerPositionL_ = ret;
  }
}
double Steer::SteerPositionL(){
  return SteerPositionL_;
}

void Steer::UpdateSteerPosition(){
  SteerPosition_ = SteerPositionH_ * 65535 +  SteerPositionL_;
}

double Steer::SteerPosition(){
  return SteerPosition_;
}

bool Steer::SteerDataRecved(){
  bool data_recved = Hdata_recved & Ldata_recved;
  return data_recved;
}