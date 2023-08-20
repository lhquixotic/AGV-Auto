#pragma once 
#include "protocol.h" 
// send a fixed msg
class RightRadarReq:public protocol{
  public:
    RightRadarReq();
    virtual ~RightRadarReq()=default;
    virtual void Update(uint8_t *data) override;
    void Reset() override;
};
