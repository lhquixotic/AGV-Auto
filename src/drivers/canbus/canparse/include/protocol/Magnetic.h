#pragma once
#include "protocol.h" 
class Magnetic:public protocol{
  public:
    Magnetic();
    virtual ~Magnetic()=default;
    void Reset() override;
    virtual void Update(uint8_t *data) override;

    double MagneticDataH();
    void UpdateMagneticDataH();
    double MagneticDataL();
    void UpdateMagneticDataL();
  private:
    // double MagneticCmd_;
    double MagneticDataH_;
    double MagneticDataL_;
};
