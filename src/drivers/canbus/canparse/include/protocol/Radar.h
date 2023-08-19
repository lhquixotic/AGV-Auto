#pragma once
#include "protocol.h" 
class Radar:public protocol{
  public:
    Radar();
    virtual ~Radar()=default;
    void Reset() override;
    virtual void Update(uint8_t *data) override;

    double RadarDataH();
    void UpdateRadarDataH();
    double RadarDataL();
    void UpdateRadarDataL();

  private:
    // double RadarCmd_;
    double RadarDataH_;
    double RadarDataL_;
};
