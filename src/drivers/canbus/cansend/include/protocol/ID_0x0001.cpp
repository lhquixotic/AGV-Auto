#include "ID_0x0001.h" 
ID_0x0001::ID_0x0001(){
  id_ = 0x1;
  dlc_ = 8;
  is_extended_ = 0;
  is_error_ = 0;
  is_rtr_ = 0;
  Reset();
  uint8_t req_msg[]={0x01,0x02,0x03,0x04,0x05,0x01,0x00,0x00};
  for(int i=0;i<dlc_;i++) data_[i] = req_msg[i];
}
void ID_0x0001::Reset(){
  
}

void MgsSend::Update(uint8_t *data){
  for(int i=0;i<dlc_;i++) data[i] = data_[i];
}

