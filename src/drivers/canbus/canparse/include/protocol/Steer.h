#pragma once
#include "protocol.h" 
class Steer:public protocol{
  public:
    Steer();
    virtual ~Steer()=default;
    void Reset() override;
    virtual void Update(uint8_t *data) override;

    uint16_t SteerPositionH();
    void UpdateSteerPositionH();
    uint16_t SteerPositionL();
    void UpdateSteerPositionL();
    double SteerPosition();
    void UpdateSteerPosition();
    bool SteerDataRecved();
  private:
    // double SteerCmd_;
    uint16_t SteerPositionH_;
    uint16_t SteerPositionL_;
    double SteerPosition_;

    bool Hdata_recved;
    bool Ldata_recved;
};
