#include "RightRadarReq.h" 
RightRadarReq::RightRadarReq(){
  id_ = 0x0522;
  dlc_ = 6;
  is_extended_ = 0;
  is_error_ = 0;
  is_rtr_ = 0;
  Reset();
  uint8_t req_msg[]={0x02,0x03,0x01,0x01,0x00,0x01}; //02 03 01 01 00 01
  for(int i=0;i<dlc_;i++) data_[i] = req_msg[i];
}
void RightRadarReq::Reset(){
  
}

void RightRadarReq::Update(uint8_t *data){
  for(int i=0;i<dlc_;i++) data[i] = data_[i];
}

