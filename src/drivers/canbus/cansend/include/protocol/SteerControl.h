#pragma once 
#include "protocol.h" 
// send a fixed msg
class SteerControl:public protocol{
  public:
    SteerControl();
    virtual ~SteerControl()=default;
    virtual void Update(uint8_t *data) override;
    void Reset() override;
    void sendBackZeroReq(int wheel_id);
    void sendLeftReq(int wheel_id);
    void sendRightReq(int wheel_id); 
    void setNullMsg();
    void sendReadReq(bool is_high, int wheel_id);

    void setHDataSteerReq(int wheel_id, uint16_t steer_angle_h);
    void setLDataSteerReq(int wheel_id, uint16_t steer_angle_l);
    void setConductSteer(int wheel_id);

    // left + right - ID:0x01 [left wheel]
    // left : 01 06 60 02 00 10 37 c6
    // right: 01 06 60 02 00 11 f6 06
    // ID: 0x02 [right wheel]
    // left : 02 06 60 02 00 10 37 F5
    // right: 02 06 60 02 00 11 F6 35

    // Read steer angle message
    // ID: 0x01 left wheel
    // [7 bytes return]
    // Read high byte: 01 03 60 2C 00 01 5B C3
    // 
    // [9 bytes return]
    // Read low byte: 01 03 60 2D 00 02 4A 02
    // 
    // ID: 0x02 right wheel
    // [7 bytes return]
    // Read high byte: 02 03 60 2C 00 01 5B F0
    // 
    // [9 bytes return]
    // Read low byte: 02 03 60 2D 00 02 4A 31

};
