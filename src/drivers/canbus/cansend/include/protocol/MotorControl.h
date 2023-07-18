#pragma once 
#include "protocol.h" 
class MotorControl:public protocol{
  public:
    MotorControl();
    virtual ~MotorControl()=default;
    virtual void Update(uint8_t *data) override;
    void Reset() override;
    double Motor1SpeedCon();
    void SetMotor1SpeedCon(double Motor1SpeedCon);
    void Set_p_Motor1SpeedCon(double Motor1SpeedCon);
    double Motor2SpeedCon();
    void SetMotor2SpeedCon(double Motor2SpeedCon);
    void Set_p_Motor2SpeedCon(double Motor2SpeedCon);
  private:
    double Motor1SpeedCon_;
    double Motor2SpeedCon_;
};
