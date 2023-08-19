#ifndef CALCULATE_HPP
#define CALCULATE_HPP
#include <cmath>

class VehicleDynamicCal{
    private:
        double B; // wheel dist
        double L; // axle dist
        double r; // wheel radius
        double PI;
    public:
        double calculate_angle(double desired_angle, bool is_left);
        double calculate_whlspd(double desired_vehspd, double desired_angle, bool is_left);
        VehicleDynamicCal();
};
#endif
