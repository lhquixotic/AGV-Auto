#pragma once 
#include "protocol.h" 
// send a fixed msg
class RadarReq:public protocol{
  public:
    RadarReq();
    virtual ~RadarReq()=default;
    virtual void Update(uint8_t *data) override;
    void Reset() override;
};
