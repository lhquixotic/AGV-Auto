#pragma once
#include "protocol.h" 
class Steer:public protocol{
  public:
    Steer();
    virtual ~Steer()=default;
    void Reset() override;
    virtual void Update(uint8_t *data) override;

    double SteerPositionH();
    void UpdateSteerPositionH();
    double SteerPositionL();
    void UpdateSteerPositionL();
    double SteerPosition();
    void UpdateSteerPosition();
    bool SteerDataRecved();
  private:
    // double SteerCmd_;
    double SteerPositionH_;
    double SteerPositionL_;
    double SteerPosition_;

    bool Hdata_recved;
    bool Ldata_recved;
};
