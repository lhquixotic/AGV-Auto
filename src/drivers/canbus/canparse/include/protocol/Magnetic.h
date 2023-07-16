#pragma once
#include "protocol.h" 
class MgsGain:public protocol{
  public:
    MgsGain();
    virtual ~MgsGain()=default;
    void Reset() override;
    virtual void Update(uint8_t *data) override;
    double MgsGainCmd();
    void UpdateMgsGainCmd();
    double MgsGainDataH();
    void UpdateMgsGainDataH();
    double MgsGainDataL();
    void UpdateMgsGainDataL();
  private:
    double MgsGainCmd_;
    double MgsGainDataH_;
    double MgsGainDataL_;
};
