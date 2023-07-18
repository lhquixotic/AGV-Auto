#include "utils.hpp"

double deadband(double input, double threshold) {
    if (std::abs(input) < threshold) {
        return 0.0;
    } else {
        return input;
    }
}

double clamp(double input, double minVal, double maxVal) {
    if (input < minVal) {
        return minVal;
    } else if (input > maxVal) {
        return maxVal;
    } else {
        return input;
    }
}