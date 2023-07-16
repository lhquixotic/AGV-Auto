#pragma once 
#include "protocol.h" 
// send a fixed msg
class ID_0x0001:public protocol{
  public:
    ID_0x0001();
    virtual ~ID_0x0001()=default;
    virtual void Update(uint8_t *data) override;
    void Reset() override;
};
