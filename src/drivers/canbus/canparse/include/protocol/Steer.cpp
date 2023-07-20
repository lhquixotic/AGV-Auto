#include "Steer.h"
#include <cstdint>

Steer::Steer(){
  id_ = 0x02;
  dlc_ = 8;
  is_extended_ = 0;
  is_error_ = 0;
  is_rtr_ = 0;
  for(int i=0;i<dlc_;i++) data_[i] = 0;
  LeftSteerPositionH_=0;
  LeftSteerPositionL_=0;
  RightSteerPositionH_=0;
  RightSteerPositionL_=0;

  Left_Hdata_recved = false;
  Left_Ldata_recved = false;
  Right_Hdata_recved = false;
  Right_Ldata_recved = false;
}
void Steer::Reset(){
  LeftSteerPositionH_=0;
  LeftSteerPositionL_=0;
  RightSteerPositionH_=0;
  RightSteerPositionL_=0;
}
void Steer::Update(uint8_t *data){
  for(int i=0;i<dlc_;i++) data_[i] = data[i];
  UpdateSteerPositionH();
  UpdateSteerPositionL();
  UpdateSteerPosition();
}

void Steer::UpdateSteerPositionH(){
  uint16_t d0 = GetByte(data_ + 0,0,8);
  uint16_t d1 = GetByte(data_ + 1,0,8);
  uint16_t d2 = GetByte(data_ + 2,0,8);
  if((d1==3)&&(d2==2)){
    uint32_t x0 = GetByte(data_ + 3,0,8);
    uint32_t x1 = GetByte(data_ + 4,0,8);
    x0<<=8;
    x1<<=0;
    x0|=x1;
    uint16_t ret = x0;
    if (d0==1){if(!Left_Hdata_recved) Left_Hdata_recved = true; LeftSteerPositionH_ = ret;}
    if (d0==2){if(!Right_Hdata_recved) Right_Hdata_recved = true; RightSteerPositionH_ = ret;}
  }
}
uint16_t Steer::LeftSteerPositionH(){
  return LeftSteerPositionH_;
}
uint16_t Steer::RightSteerPositionH(){
  return RightSteerPositionH_;
}

void Steer::UpdateSteerPositionL(){
  uint16_t d0 = GetByte(data_ + 0,0,8);
  uint16_t d1 = GetByte(data_ + 1,0,8);
  uint16_t d2 = GetByte(data_ + 2,0,8);
  if((d1==3)&&(d2==4)){
    uint32_t x0 = GetByte(data_ + 3,0,8);
    uint32_t x1 = GetByte(data_ + 4,0,8);
    x0<<=8;
    x1<<=0;
    x0|=x1;
    uint16_t ret = x0;
    if (d0==1){if(!Left_Ldata_recved) Left_Ldata_recved = true; LeftSteerPositionL_ = ret;}
    if (d0==2){if(!Right_Ldata_recved) Right_Ldata_recved = true; RightSteerPositionL_ = ret;}
  }
}
uint16_t Steer::LeftSteerPositionL(){
  return LeftSteerPositionL_;
}
uint16_t Steer::RightSteerPositionL(){
  return RightSteerPositionL_;
}

void Steer::UpdateSteerPosition(){
  int32_t result_l = (static_cast<int32_t>(LeftSteerPositionH_)<<16) | LeftSteerPositionL_;
  LeftSteerPosition_ = result_l/8800.0;
  int32_t result_r = (static_cast<int32_t>(RightSteerPositionH_)<<16) | RightSteerPositionL_;
  RightSteerPosition_ = result_r/8800.0;
}

double Steer::LeftSteerPosition(){
  return LeftSteerPosition_;
}
double Steer::RightSteerPosition(){
  return RightSteerPosition_;
}

bool Steer::LeftSteerDataRecved(){
  bool data_recved = Left_Hdata_recved & Left_Ldata_recved;
  return data_recved;
}

bool Steer::RightSteerDataRecved(){
  bool data_recved = Right_Hdata_recved & Right_Ldata_recved;
  return data_recved;
}