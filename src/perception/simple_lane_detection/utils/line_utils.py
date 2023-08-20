import cv2
import numpy as np
from math import sqrt, atan, pi

def normalize_hough_directions(hough):
    hough_new = []
    hough = hough.reshape((-1, 4))
    for line in hough:
        [x1, y1, x2, y2] = line
        if y1>=y2:
            hough_new.append([x1, y1, x2, y2])
        else:
            hough_new.append([x2, y2, x1, y1])
    return np.array(hough_new)

def smooth_track(track, last_line):
    last_paras = np.polyfit((last_line[0],last_line[2]), (last_line[1],last_line[3]), 1)
    last_angle = (180.0 + (atan(last_paras[0]))/pi*180.0) % 180.0
    paras = np.polyfit((track[0,0], track[0,2]), (track[0,1],track[0,3]), 1)
    angle = (180.0 + (atan(paras[0]))/pi*180.0) % 180.0
    if abs(angle - last_angle) > 30:
        return (last_line.copy())[None,:]
    else:
        return track

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

"""
def select_track_line(hough, x, y, flag, last_line, threshold = 80.0):
    new_hough = []
    for line in hough:
        x1, y1, x2, y2 = line.reshape(4)
        if x1< x-threshold and x1>x+threshold:
            continue
        new_hough.append([x1, y1, x2, y2])
    new_hough = np.array(new_hough)
    if len(new_hough) == 0:
        return (last_line.copy())[None,:]
    elif len(new_hough) <= 2:
        max_dist = 0.0; max_paras = []
        for line in new_hough:
            dist = min_num(point2point_distance(np.array([x,y]), line[:2]), \
                    point2point_distance(np.array([x,y]), line[2:]))
            if dist >= max_dist:
                max_paras = line.copy()
                max_dist = dist
        return max_paras[None,:]
    else:
        track = np.zeros((4))
        for line in new_hough:
            for kk in range(4):
                track[kk] += line[kk]
        track /= len(new_hough)
        return np.round(track[None,:]).astype(np.int32)
s"""

def select_track_line(hough, x, y, flag, last_line):
    new_hough = []
    hough = np.array(hough)
    min_dist = 10000.0; min_paras = []
    if last_line.max() > 0.0:
        x = last_line[0]
        y = last_line[1]
    for line in hough:
        dist = min_num(point2point_distance(np.array([x,y]), line[:2]), \
                point2point_distance(np.array([x,y]), line[2:]))
        if dist <= min_dist:
            min_dist = dist
            min_paras = line.copy()
    return min_paras[None,:]

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
