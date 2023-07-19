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
    // ID: 0x01
    // left : 01 06 60 02 00 10 37 c6
    // right: 01 06 60 02 00 11 f6 06
    // ID: 0x02
    // left : 02 06 60 02 00 10 37 F5
    // right: 02 06 60 02 00 11 F6 35

void SteerControl::sendLeftReq(int wheel_id){
  uint8_t left_msg_1[] = {0x01,0x06,0x60,0x02,0x00,0x10,0x37,0xc6};
  uint8_t left_msg_2[] = {0x02,0x06,0x60,0x02,0x00,0x10,0x37,0xf5};

  for(int i=0;i<dlc_;i++) {
    if(wheel_id == 1) data_[i] = left_msg_1[i];
    else data_[i] = left_msg_2[i];
  }
}

void SteerControl::sendRightReq(int wheel_id){
  uint8_t right_msg_1[] = {0x01,0x06,0x60,0x02,0x00,0x11,0xf6,0x06};
  uint8_t right_msg_2[] = {0x02,0x06,0x60,0x02,0x00,0x11,0xf6,0x35};

  for(int i=0;i<dlc_;i++) {
    if(wheel_id == 1) data_[i] = right_msg_1[i];
    else data_[i] = right_msg_2[i];
  }
   
}

void SteerControl::setNullMsg(){
  uint8_t right_msg[]={0x00,0x00,0x00,0x00,0x00,0x0,0x0,0x0};
  for(int i=0;i<dlc_;i++) data_[i] = right_msg[i];
}

void SteerControl::sendReadReq(bool is_high, int wheel_id){
  // Read steer angle message
  // ID: 0x01 left wheel
  // [7 bytes return]
  // Read low byte: 01 03 60 2D 00 01 0A 03
  // Read high byte: 01 03 60 2C 00 01 5B C3
  // [9 bytes return]
  // Read low byte: 01 03 60 2D 00 02 4A 02
  uint8_t low_byte_msg[] = {0x01,0x03,0x60,0x2D,0x00,0x02,0x4a,0x02};
  uint8_t high_byte_msg[] = {0x01,0x03,0x60,0x2c,0x00,0x01,0x5b,0xc3};
  if (wheel_id==1){
    for(int i=0; i<dlc_; i++){
      if (is_high) data_[i] = high_byte_msg[i];
      else data_[i] = low_byte_msg[i];
    }
  }
}