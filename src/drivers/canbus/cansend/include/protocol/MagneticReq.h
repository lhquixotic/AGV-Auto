#pragma once 
#include "protocol.h" 
// send a fixed msg
class MagneticReq:public protocol{
  public:
    MagneticReq();
    virtual ~MagneticReq()=default;
    virtual void Update(uint8_t *data) override;
    void Reset() override;
};
