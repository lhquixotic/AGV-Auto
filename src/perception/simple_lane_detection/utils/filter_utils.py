import cv2
import numpy as np
from math import atan, pi

def filter_track_hough(img, track_hough, last_line):
    if last_line.max() > 0.0:
        last_paras = np.polyfit((last_line[0],last_line[2]), (last_line[1],last_line[3]), 1)
        last_angle = (180.0 + (atan(last_paras[0]))/pi*180.0) % 180.0
    new_hough = []

    for line in track_hough:
        x1, y1, x2, y2 = line.reshape(4)
        if img[y1, x1, 2]> 194:
            continue
        parameters = np.polyfit((x1, x2), (y1, y2), 1)
        if abs(parameters[0]) <= 1.0:
            continue
        if last_line.max() > 0.0:
            angle = (180.0 + (atan(parameters[0]))/pi*180.0) % 180.0
            if abs(angle - last_angle) > 35:
                continue 
            
            dist = abs(x1 - last_line[0])
            if dist > 200:
                continue
            
        new_hough.append([x1, y1, x2, y2])
    return np.array(new_hough)

def select_track_salient_points(img, canny):
    img_max = np.max(img, axis=-1)
    img_max = (img_max<=96).astype(np.uint8)
    img_mask = img_max.copy()
    for i in range(-10, 11):
        for j in range(-10, 11):
            affine_arr = np.float32([[1,0,i],[0,1,j]])
            res = cv2.warpAffine(img_max,affine_arr,(img_max.shape[1],img_max.shape[0]))
            img_mask = 1-((1-img_mask) * (1-res))

    return img_mask, canny*img_mask

def select_lane_salient_points(img, canny):
    img_max = ((np.max(img, axis=-1))>=150).astype(np.uint8)
    diff1 = img[:,:,2] - img[:,:,1]; diff2 = img[:,:,1] - img[:,:,0]
    diff1 = (diff1>=10).astype(np.uint8); diff2 = (diff2 >= 10).astype(np.uint8)
    diff = (diff1 * diff2 * img_max)
    img_mask = diff.copy()
    for i in range(-10, 11):
        for j in range(-10, 11):
            affine_arr = np.float32([[1,0,i],[0,1,j]])
            res = cv2.warpAffine(diff,affine_arr,(diff.shape[1],diff.shape[0]))
            img_mask = 1-((1-img_mask) * (1-res))

    return img_mask, canny*img_mask

def select_lane_line(lane_lines, track_line):
    min_angle_diff = 1000.0; min_pos = -1
    for i in range(0, len(lane_lines)):
        diff = abs(track_line[0] - lane_lines[i][0])
        if diff < min_angle_diff:
            min_angle_diff = diff
            min_pos = i
    return lane_lines[min_pos]
