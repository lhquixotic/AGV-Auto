#include "calculate.hpp"

VehicleDynamicCal::VehicleDynamicCal(){
    B = 1.7;
    L = 3.03;
    r = 0.15;
    PI = 3.141593;
    R = 0;
}

double VehicleDynamicCal::calculate_angle(double desired_angle, bool is_left){
    if(desired_angle<2){R=1000;return desired_angle;}
    R = L / tan(desired_angle/180*PI);
    if(is_left){return atan(L/(R-B/2))*180/PI;}
    else {return atan(L/(R+B/2))*180/PI;}
}

// double VehicleDynamicCal::calculate_whlspd(double desired_vehspd, double desired_angle, bool is_left){
//     if(desired_angle<2){R=1000;return 30/(PI*r)*desired_vehspd;}
//     R = L / tan(desired_angle/180*PI);
//     if(is_left){return 30/(PI*r)*desired_vehspd*(2*R-B)/(2*R);}
//     else{return 30/(PI*r)*desired_vehspd*(2*R+B)/(2*R);}
// }

double VehicleDynamicCal::calculate_whlspd(double desired_whlspd, double desired_angle, bool is_left){
    if(desired_angle<2){R=1000;return desired_whlspd;}
    R = L / tan(desired_angle/180*PI);
    if(is_left){return desired_whlspd*(2*R-B)/(2*R);}
    else{return desired_whlspd*(2*R+B)/(2*R);}
}