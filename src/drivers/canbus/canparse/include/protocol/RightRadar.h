#pragma once
#include "protocol.h" 
class RightRadar:public protocol{
  public:
    RightRadar();
    virtual ~RightRadar()=default;
    void Reset() override;
    virtual void Update(uint8_t *data) override;

    double RightRadarDataH();
    void UpdateRightRadarDataH();
    double RightRadarDataL();
    void UpdateRightRadarDataL();

  private:
    // double RightRadarCmd_;
    double RightRadarDataH_;
    double RightRadarDataL_;
};
