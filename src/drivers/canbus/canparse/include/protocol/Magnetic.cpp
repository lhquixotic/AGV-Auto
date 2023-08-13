#include "Magnetic.h"
#include <iostream>

Magnetic::Magnetic(){
  // id_ = 0x42;
  id_ = 0x04; //FIXME(LHQ): new magnetic device
  dlc_ = 8;
  is_extended_ = 0;
  is_error_ = 0;
  is_rtr_ = 0;
  for(int i=0;i<dlc_;i++) data_[i] = 0;
  MagneticDataH_=0;
  MagneticDataL_=0;
}
void Magnetic::Reset(){
  MagneticDataH_=0;
  MagneticDataL_=0;
}
void Magnetic::Update(uint8_t *data){
  // std::cout <<"[0x042] ";
  for(int i=0;i<dlc_;i++) 
   {data_[i] = data[i];
    // if(i>5) std::cout << data[i];
   }
  // std::cout << std::endl;
  UpdateMagneticDataH();
  UpdateMagneticDataL();
}
/******************
signalname: MagneticDataH;
signalclass: uint8;
StartBit: 48;
SignalSize: 8;
ByteOrder: LittleEndian;
Factor: 1;
Offset: 0;
Minimum: 0;
Maximum: 255;
******************/
void Magnetic::UpdateMagneticDataH(){
  // int16_t x0 = GetByte(data_ + 6,0,8);                  
  int16_t x0 = GetByte(data_ + 1,0,8);                  

  x0<<=0;
  double ret = x0 * 1.0000000000 + 0.0000000000;
  MagneticDataH_ = ret;
}
double Magnetic::MagneticDataH(){
  return MagneticDataH_;
}
/******************
signalname: MagneticDataL;
signalclass: uint8;
StartBit: 56;
SignalSize: 8;
ByteOrder: LittleEndian;
Factor: 1;
Offset: 0;
Minimum: 0;
Maximum: 255;
******************/
void Magnetic::UpdateMagneticDataL(){
  // int16_t x0 = GetByte(data_ + 7,0,8);
  int16_t x0 = GetByte(data_ + 2,0,8);

  x0<<=0;
  double ret = x0 * 1.0000000000 + 0.0000000000;
  MagneticDataL_ = ret;
}
double Magnetic::MagneticDataL(){
  return MagneticDataL_;
}
