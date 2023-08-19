import cv2
import numpy as np
from math import sqrt, atan, pi

def point_distance_line(point,line_point1,line_point2):
    vec1 = line_point1 - point
    vec2 = line_point2 - point
    distance = np.abs(np.cross(vec1,vec2)) / np.linalg.norm(line_point1-line_point2)
    return distance

def point2point_distance(p1, p2):
    return sqrt((p1[0]-p2[0])*(p1[0]-p2[0]) + (p1[1]-p2[1])*(p1[1]-p2[1]))

def min_num(x, y):
    if x<y:
        return x
    return y

def select_track_line(hough, x, y, flag):
    min_dist = 1000.0; min_paras = [0.0,0.0,0.0,0.0]
    for line in hough:
        x1, y1, x2, y2 = line.reshape(4)
        # parameters = np.polyfit((x1, x2), (y1, y2), 1)
        dist = min_num(point2point_distance(np.array([x, y]), np.array([x1, y1])), point2point_distance(np.array([x, y]), np.array([x2, y2])))
        if dist < min_dist:
            min_dist = dist
            min_paras[0] = x1; min_paras[1] = y1; min_paras[2] = x2; min_paras[3] = y2
    return np.array(min_paras)[None,:]

def cross_product(p1, p2, p3):
    return (p2[0] - p1[0]) * (p3[1] - p1[1]) - (p3[0] - p1[0]) * (p2[1] - p1[1])

def is_intersected(line1, line2):
    if cross_product(line1[:2], line1[2:], line2[:2]) * cross_product(line1[:2], line1[2:], line2[2:]) < 0 and \
        cross_product(line2[:2], line2[2:], line1[:2]) * cross_product(line2[:2], line2[2:], line1[2:]) < 0:
        return True
    else:
        return False
    
def select_lane_line(hough, track):
    track = np.squeeze(track)
    track_paras = np.polyfit((track[0], track[2]), (track[1], track[3]), 1)
    track_angle = (180+(atan(track_paras[0]))/pi*180)%180
    max_len = 0.0; max_paras = [0.0,0.0,0.0,0.0]
    for line in hough:
        x1, y1, x2, y2 = line.reshape(4)
        if is_intersected(track, [x1,y1,x2,y2]):
            continue
        parameters = np.polyfit((x1, x2), (y1, y2), 1)
        line_angle = (180+(atan(parameters[0]))/pi*180)%180
        if abs(line_angle-track_angle) <= 10.0 or abs(line_angle-track_angle)>=72.0:
            continue
        dist = sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2))
        if dist >  max_len:
            max_len = dist
            max_paras[0] = x1; max_paras[1] = y1; max_paras[2] = x2; max_paras[3] = y2
    return np.array(max_paras)[None,:]

def visualize_lines(frame, lines):
    # Creates an image filled with zero intensities with the same dimensions as the frame
    lines_visualize = frame
    # Checks if any lines are detected
    if lines is not None:
        for line in lines:
            x1, y1, x2, y2 = line.reshape(4)
            # Draws lines between two coordinates with green color and 5 thickness
            cv2.line(lines_visualize, (x1, y1), (x2, y2), (0, 255, 0), 5)
    return lines_visualize
