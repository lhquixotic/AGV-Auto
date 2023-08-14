import cv2
import numpy as np
import sys
from math import sqrt

def do_canny(frame):
    # Converts frame to grayscale because we only need the luminance channel for detecting edges - less computationally expensive
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    # Applies a 5x5 gaussian blur with deviation of 0 to frame - not mandatory since Canny will do this for us
    blur = cv2.GaussianBlur(gray, (5, 5), 0)
    # Applies Canny edge detector with minVal of 50 and maxVal of 150
    canny = cv2.Canny(blur, 50, 150)
    return canny

def do_segment(frame):
    # Since an image is a multi-directional array containing the relative intensities of each pixel in the image, we can use frame.shape to return a tuple: [number of rows, number of columns, number of channels] of the dimensions of the frame
    # frame.shape[0] give us the number of rows of pixels the frame has. Since height begins from 0 at the top, the y-coordinate of the bottom of the frame is its height
    height = frame.shape[0]; width = frame.shape[1]
    # Creates a triangular polygon for the mask defined by three (x, y) coordinates
    polygons = np.array([
                            [(0, height), (0, height*0.3), (width, height*0.3), (width, height)]
                        ])
    # Creates an image filled with zero intensities with the same dimensions as the frame
    mask = np.zeros_like(frame).astype(np.uint8)
    mask[int(height*0.32):,:] = 255
    # Allows the mask to be filled with values of 1 and the other areas to be filled with values of 0
    # cv2.fillPoly(mask, polygons, 255)
    # A bitwise and operation between the mask and frame keeps only the triangular area of the frame
    segment = cv2.bitwise_and(frame, mask)
    return segment

def filter_hough(frame, hough):
    height = frame.shape[0]
    new_hough = []
    for line in hough:
        x1, y1, x2, y2 = line.reshape(4)
        parameters = np.polyfit((x1, x2), (y1, y2), 1)
        if abs(parameters[0]) <= 1.0:
            continue
        if sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)) <= height*0.2:
            continue
        new_hough.append([x1, y1, x2, y2])
    return np.array(new_hough)

def calculate_lines(frame, lines):
    # Empty arrays to store the coordinates of the left and right lines
    left = []
    middle = []
    right = []

    max_slope = 0.0; max_ind = -1
    for k, line in enumerate(lines):
        x1, y1, x2, y2 = line.reshape(4)
        parameters = np.polyfit((x1, x2), (y1, y2), 1)
        slope = parameters[0]
        if abs(slope) > max_slope:
            max_slope = abs(slope)
            max_ind = k
    x1, y1, x2, y2 = (lines[max_ind]).reshape(4)
    parameters = np.polyfit((x1, x2), (y1, y2), 1)
    middle = (parameters[0], parameters[1])

    min_left_slope = 10000.0; min_left_ind = -1
    min_right_slope = 10000.0; min_right_ind = -1
    for k, line in enumerate(lines):
        x1, y1, x2, y2 = line.reshape(4)
        parameters = np.polyfit((x1, x2), (y1, y2), 1)
        slope = parameters[0]
        if slope < 0.0:
            if abs(slope) < min_left_slope:
                min_left_slope = abs(slope)
                min_left_ind = k
        elif slope > 0.0:
            if abs(slope) < min_right_slope:
                min_right_slope = abs(slope)
                min_right_ind = k

    x1, y1, x2, y2 = (lines[min_left_ind]).reshape(4)
    parameters = np.polyfit((x1, x2), (y1, y2), 1)
    left = (parameters[0], parameters[1])
    x1, y1, x2, y2 = (lines[min_right_ind]).reshape(4)
    parameters = np.polyfit((x1, x2), (y1, y2), 1)
    right = (parameters[0], parameters[1])

    # Loops through every detected line
    """
    for line in lines:
        # Reshapes line from 2D array to 1D array
        x1, y1, x2, y2 = line.reshape(4)
        # Fits a linear polynomial to the x and y coordinates and returns a vector of coefficients which describe the slope and y-intercept
        parameters = np.polyfit((x1, x2), (y1, y2), 1)
        slope = parameters[0]
        y_intercept = parameters[1]
        if abs(abs(slope) - max_slope) <= 0.05:
            middle.append((slope, y_intercept))
        elif slope < 0:
            left.append((slope, y_intercept))
        else:
            right.append((slope, y_intercept))
    # Averages out all the values for left and right into a single slope and y-intercept value for each line
    left_avg = np.average(left, axis = 0)
    right_avg = np.average(right, axis = 0)
    middle_avg = np.average(middle, axis = 0)
    """
    # Calculates the x1, y1, x2, y2 coordinates for the left and right lines
    left_line = calculate_coordinates(frame, left)
    middle_line = calculate_coordinates(frame, middle)
    right_line = calculate_coordinates(frame, right)
    return np.array([left_line, middle_line, right_line])

def calculate_coordinates(frame, parameters):
    print(str(parameters))
    sys.stdout.flush()
    slope, intercept = parameters
    # Sets initial y-coordinate as height from top down (bottom of the frame)
    y1 = frame.shape[0]
    # Sets final y-coordinate as 150 above the bottom of the frame
    y2 = int(y1/8.0)
    # Sets initial x-coordinate as (y1 - b) / m since y1 = mx1 + b
    x1 = int((y1 - intercept) / slope)
    # Sets final x-coordinate as (y2 - b) / m since y2 = mx2 + b
    x2 = int((y2 - intercept) / slope)
    return np.array([x1, y1, x2, y2])

def visualize_lines(frame, lines):
    # Creates an image filled with zero intensities with the same dimensions as the frame
    lines_visualize = frame
    # Checks if any lines are detected
    if lines is not None:
        for line in lines:
            print(str(line))
            sys.stdout.flush()
            x1, y1, x2, y2 = line.reshape(4)
            # Draws lines between two coordinates with green color and 5 thickness
            cv2.line(lines_visualize, (x1, y1), (x2, y2), (0, 255, 0), 5)
    return lines_visualize

