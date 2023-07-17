#include "SteerControl.h" 
SteerControl::SteerControl(){
  id_ = 0x2;
  dlc_ = 8;
  is_extended_ = 0;
  is_error_ = 0;
  is_rtr_ = 0;
  Reset();
  uint8_t req_msg[]={0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
  for(int i=0;i<dlc_;i++) data_[i] = req_msg[i];
}
void SteerControl::Reset(){
  
}

void SteerControl::Update(uint8_t *data){
  for(int i=0;i<dlc_;i++) data[i] = data_[i];
}

    // left : 01 06 60 02 00 10 37 c6
    // right: 01 06 60 02 00 11 f6 06

void SteerControl::sendLeftReq(){
  uint8_t left_msg[]={0x01,0x06,0x60,0x02,0x00,0x10,0x37,0xc6};
  for(int i=0;i<dlc_;i++) data_[i] = left_msg[i];
}

void SteerControl::sendRightReq(){
  uint8_t right_msg[]={0x01,0x06,0x60,0x02,0x00,0x11,0xf6,0x06};
  for(int i=0;i<dlc_;i++) data_[i] = right_msg[i];
}

void SteerControl::setNullMsg(){
  uint8_t right_msg[]={0x00,0x00,0x00,0x00,0x00,0x0,0x0,0x0};
  for(int i=0;i<dlc_;i++) data_[i] = right_msg[i];
}