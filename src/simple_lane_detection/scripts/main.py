import cv2
import numpy as np
import os, glob

from utils.image_utils import *
from utils.filter_utils import *
from utils.line_utils import *

img_dir = 'imgs'
save_dir = 'imgs'
names = os.listdir(img_dir)

for name in names:
    name = name.strip()
    img = cv2.imread(os.path.join(img_dir, name))
    canny = do_canny(img)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_canny.jpg'), canny)
    seg = do_segment(canny)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_seg.jpg'), seg)
    track_mask, track_seg = select_track_salient_points(img.copy(), seg)
    lane_mask, lane_seg = select_lane_salient_points(img.copy(), seg)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_track_seg.jpg'), track_seg)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_track_mask.jpg'), track_mask)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_lane_seg.jpg'), lane_seg)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_lane_mask.jpg'), lane_mask)
    track_hough = cv2.HoughLinesP(track_seg, 2, np.pi / 180, 40, np.array([]), minLineLength = 30, maxLineGap = 50)
    track_hough_visualize = visualize_lines(img.copy(), track_hough)
    lane_hough = cv2.HoughLinesP(lane_seg, 2, np.pi / 180, 75, np.array([]), minLineLength = 60, maxLineGap = 50) 
    lane_hough_visualize = visualize_lines(img.copy(), lane_hough)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_track_hough.jpg'), track_hough_visualize)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_lane_hough.jpg'), lane_hough_visualize)
    track = select_track_line(track_hough)
    track_visualize = visualize_lines(img, track)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_track.jpg'), track_visualize)
    lane = select_lane_line(lane_hough, track)
    lane_visualize = visualize_lines(img, lane)
    cv2.imwrite(os.path.join(save_dir, name[:-4]+'_lane.jpg'), lane_visualize)
    print('track: ' + str(np.squeeze(track)))
    print('lane: ' + str(np.squeeze(lane)))
