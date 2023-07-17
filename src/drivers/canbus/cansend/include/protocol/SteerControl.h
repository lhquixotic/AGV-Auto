#pragma once 
#include "protocol.h" 
// send a fixed msg
class SteerControl:public protocol{
  public:
    SteerControl();
    virtual ~SteerControl()=default;
    virtual void Update(uint8_t *data) override;
    void Reset() override;
    void sendBackZeroReq();
    void sendLeftReq();
    void sendRightReq();
    void setNullMsg();
    // left + right -
    // left : 01 06 60 02 00 10 37 c6
    // right: 01 06 60 02 00 11 f6 06
};
