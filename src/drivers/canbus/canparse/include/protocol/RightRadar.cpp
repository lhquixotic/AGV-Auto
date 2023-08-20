#include "RightRadar.h"
#include <iostream>

RightRadar::RightRadar(){
  // id_ = 0x42;
  id_ = 0x0522; 
  dlc_ = 5;
  is_extended_ = 0;
  is_error_ = 0;
  is_rtr_ = 0;
  for(int i=0;i<dlc_;i++) data_[i] = 0;
  RightRadarDataH_=0xff;
  RightRadarDataL_=0xff;
}
void RightRadar::Reset(){
  RightRadarDataH_=0xff;
  RightRadarDataL_=0xff;
}
void RightRadar::Update(uint8_t *data){
  // std::cout <<"[0x042] ";
  for(int i=0;i<dlc_;i++) 
   {data_[i] = data[i];
    // if(i>5) std::cout << data[i];
   }
  // std::cout << std::endl;
  uint16_t d0 = GetByte(data_ + 0,0,8);
  uint16_t d1 = GetByte(data_ + 1,0,8);
  uint16_t d2 = GetByte(data_ + 2,0,8);
  if ((d0==0x02)&&(d1==0x83)&&(d2==0x02)){
    UpdateRightRadarDataH();
    UpdateRightRadarDataL();
  }
}
/******************
signalname: RightRadarDataH;
signalclass: uint8;
StartBit: 48;
SignalSize: 8;
ByteOrder: LittleEndian;
Factor: 1;
Offset: 0;
Minimum: 0;
Maximum: 255;
******************/
void RightRadar::UpdateRightRadarDataH(){
  // int16_t x0 = GetByte(data_ + 6,0,8);                  
  int16_t x0 = GetByte(data_ + 3,0,8);                  

  x0<<=0;
  double ret = x0 * 1.0000000000 + 0.0000000000;
  RightRadarDataH_ = ret;
}
double RightRadar::RightRadarDataH(){
  return RightRadarDataH_;
}
/******************
signalname: RightRadarDataL;
signalclass: uint8;
StartBit: 56;
SignalSize: 8;
ByteOrder: LittleEndian;
Factor: 1;
Offset: 0;
Minimum: 0;
Maximum: 255;
******************/
void RightRadar::UpdateRightRadarDataL(){
  // int16_t x0 = GetByte(data_ + 7,0,8);
  int16_t x0 = GetByte(data_ + 4,0,8);

  x0<<=0;
  double ret = x0 * 1.0000000000 + 0.0000000000;
  RightRadarDataL_ = ret;
}
double RightRadar::RightRadarDataL(){
  return RightRadarDataL_;
}
