#pragma once
#include "protocol.h" 
class Steer:public protocol{
  public:
    Steer();
    virtual ~Steer()=default;
    void Reset() override;
    virtual void Update(uint8_t *data) override;

    uint16_t LeftSteerPositionH();
    uint16_t RightSteerPositionH();
    void UpdateSteerPositionH();
    uint16_t LeftSteerPositionL();
    uint16_t RightSteerPositionL();
    void UpdateSteerPositionL();
    double LeftSteerPosition();
    double RightSteerPosition();
    void UpdateSteerPosition();
    bool LeftSteerDataRecved();
    bool RightSteerDataRecved();

  private:
    // double SteerCmd_;
    uint16_t LeftSteerPositionH_;
    uint16_t LeftSteerPositionL_;
    double LeftSteerPosition_;
    uint16_t RightSteerPositionH_;
    uint16_t RightSteerPositionL_;
    double RightSteerPosition_;
    
    bool Left_Hdata_recved;
    bool Left_Ldata_recved;
    bool Right_Hdata_recved;
    bool Right_Ldata_recved;
};
