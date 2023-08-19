import cv2
import numpy as np
import os, glob

from utils.image_utils import *
from utils.filter_utils import *
from utils.line_utils import *

video_file = ''
save_dir = ''

cap = cv2.VideoCapture(video_file)
fps = 15; size = (1280, 480)
videoWriter = cv2.VideoWriter(os.path.join(save_dir, os.path.basename(video_file)), \
                              cv2.VideoWriter_fourcc('M','P','E','G'), fps, size)

while True:
    _, img = cap.read()
    canny = do_canny(img)
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_canny.jpg'), canny)
    seg = do_segment(canny)
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_seg.jpg'), seg)
    track_mask, track_seg = select_track_salient_points(img.copy(), seg)
    lane_mask, lane_seg = select_lane_salient_points(img.copy(), seg)
    # /*
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_track_seg.jpg'), track_seg)
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_track_mask.jpg'), track_mask)
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_lane_seg.jpg'), lane_seg)
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_lane_mask.jpg'), lane_mask)*/
    track_hough = cv2.HoughLinesP(track_seg, 2, np.pi / 180, 40, np.array([]), minLineLength = 30, maxLineGap = 50)
    track_hough_visualize = visualize_lines(img.copy(), track_hough)
    lane_hough = cv2.HoughLinesP(lane_seg, 2, np.pi / 180, 75, np.array([]), minLineLength = 60, maxLineGap = 50) 
    lane_hough_visualize = visualize_lines(img.copy(), lane_hough)
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_track_hough.jpg'), track_hough_visualize)
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_lane_hough.jpg'), lane_hough_visualize)
    track = select_track_line(track_hough)
    track_visualize = visualize_lines(img.copy(), track)
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_track.jpg'), track_visualize)
    lane = select_lane_line(lane_hough, track)
    lane_visualize = visualize_lines(track_visualize, lane)
    # cv2.imwrite(os.path.join(save_dir, name[:-4]+'_lane.jpg'), lane_visualize)
    print('track: ' + str(np.squeeze(track)))
    print('lane: ' + str(np.squeeze(lane)))
    videoWriter.write(np.concatenate([img, lane_visualize], axis=1))

videoWriter.release()
cap.release()
