#include "calculate.hpp"

VehicleDynamicCal::VehicleDynamicCal(){
    B = 1.7;
    L = 3.03;
    r = 0.15;
    PI = 3.141593;
}

double VehicleDynamicCal::calculate_angle(double desired_angle, bool is_left){
    if(std::abs(desired_angle)<2){return desired_angle;}
    double R = L / tan(desired_angle/180*PI);
    if(is_left){return atan(L/(R-B/2))*180/PI;}
    else {return atan(L/(R+B/2))*180/PI;}
}

double VehicleDynamicCal::calculate_whlspd(double desired_whlspd, double desired_angle, bool is_left){
    if(std::abs(desired_angle)<4){return desired_whlspd;}
    double R = L / tan(desired_angle/180*PI);
    if(is_left){return desired_whlspd*(2*R-B)/(2*R);}
    else{return desired_whlspd*(2*R+B)/(2*R);}
}