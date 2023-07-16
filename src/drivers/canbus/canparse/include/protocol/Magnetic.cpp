#include "Magnetic.h"
MgsGain::MgsGain(){
  id_ = 0x2;
  dlc_ = 8;
  is_extended_ = 0;
  is_error_ = 0;
  is_rtr_ = 0;
  for(int i=0;i<dlc_;i++) data_[i] = 0;
  MgsGainCmd_=0;
  MgsGainDataH_=0;
  MgsGainDataL_=0;
}
void MgsGain::Reset(){
  MgsGainCmd_=0;
  MgsGainDataH_=0;
  MgsGainDataL_=0;
}
void MgsGain::Update(uint8_t *data){
  for(int i=0;i<dlc_;i++) data_[i] = data[i];
  UpdateMgsGainCmd();
  UpdateMgsGainDataH();
  UpdateMgsGainDataL();
}
/******************
signalname: MgsGainCmd;
signalclass: uint8;
StartBit: 40;
SignalSize: 8;
ByteOrder: LittleEndian;
Factor: 1;
Offset: 0;
Minimum: 0;
Maximum: 3;
******************/
void MgsGain::UpdateMgsGainCmd(){
  int16_t x0 = GetByte(data_ + 5,0,8);
  x0<<=0;
  double ret = x0 * 1.0000000000 + 0.0000000000;
  MgsGainCmd_ = ret;
}
double MgsGain::MgsGainCmd(){
  return MgsGainCmd_;
}
/******************
signalname: MgsGainDataH;
signalclass: uint8;
StartBit: 48;
SignalSize: 8;
ByteOrder: LittleEndian;
Factor: 1;
Offset: 0;
Minimum: 0;
Maximum: 255;
******************/
void MgsGain::UpdateMgsGainDataH(){
  int16_t x0 = GetByte(data_ + 6,0,8);
  x0<<=0;
  double ret = x0 * 1.0000000000 + 0.0000000000;
  MgsGainDataH_ = ret;
}
double MgsGain::MgsGainDataH(){
  return MgsGainDataH_;
}
/******************
signalname: MgsGainDataL;
signalclass: uint8;
StartBit: 56;
SignalSize: 8;
ByteOrder: LittleEndian;
Factor: 1;
Offset: 0;
Minimum: 0;
Maximum: 255;
******************/
void MgsGain::UpdateMgsGainDataL(){
  int16_t x0 = GetByte(data_ + 7,0,8);
  x0<<=0;
  double ret = x0 * 1.0000000000 + 0.0000000000;
  MgsGainDataL_ = ret;
}
double MgsGain::MgsGainDataL(){
  return MgsGainDataL_;
}
