#!/usr/bin/env python
# coding=utf-8
import cv2
import numpy as np
import rospy
from math import sqrt

from cv_bridge import CvBridge
from geometry_msgs.msg import Point
from sensor_msgs.msg import Image
from std_msgs.msg import Float32
from simple_lane_detection.msg import object
from enum import Enum
import sys
# sys.setdefaultencoding('utf8')
sys.path.append('/home/nvidia/AGV-Auto/src/simple_lane_detection/utils')
# from math import sqrt
from math import sqrt, atan, pi
from image_utils import *
from filter_utils import *
from line_utils import *

camera_point = Point()
camera_point.x = 0.0
camera_point.y = 0.0
point = object()
bridge = CvBridge()
flag = Float32()
outimag = Image()
video_file = '/home/ywb/Lab/IPCS_Huo/JD/ROS_2/1.avi'
capture = cv2.VideoCapture(video_file)
# capture.open(video_file)

def flag_callback(msg):
    flag = msg


def image_callback(msg):
    # ret, frame = capture.read()
    # ret, frame = msg.read()
    # img = frame
    img = bridge.imgmsg_to_cv2(msg) # img preprocessing .....
    img = img[:,:,[2,1,0]]
    # print(type(img))
    canny = do_canny(img)
    seg = do_segment(canny)
    track_hough = cv2.HoughLinesP(seg, 2, np.pi / 180, 90, np.array([]), minLineLength = 75, maxLineGap = 50)
    if track_hough is None or len(track_hough) == 0:
        track = np.array([-1.0, -1.0, -1.0, -1.0])
        track_visualize = img.copy()
    else:
        track_hough = filter_track_hough(track_hough)
        track_hough_filter_visualize = visualize_lines(img.copy(), track_hough)
        track = select_track_line(track_hough, camera_point.x, camera_point.y, flag)
        track_visualize = visualize_lines(img.copy(), track)
    track = np.squeeze(track)
    point.mid_cx_down = track[0]
    point.mid_cy_down = track[1]
    
    point.mid_cx_upper = track[2]
    point.mid_cy_upper = track[3]
    # point.right_cy_down = track[1]
    # point.cy_upper = track[3]
    outimag = bridge.cv2_to_imgmsg(track_visualize, encoding="bgr8")
    car_line_pub.publish(point)
    out_image_pub.publish(outimag)
    #ROS_INFO("The point:%",point)

if __name__ == '__main__':
	# Initialize the ROS node and create a subscriber to the /usb_cam/image_raw topic
    rospy.init_node('car_line')
    rate = rospy.Rate(10) # 10hz
    camera_point.x = rospy.get_param('~camera_x')
    camera_point.y = rospy.get_param('~camera_y')
    flag = rospy.get_param('~flag')
    image_sub = rospy.Subscriber('/usb_cam_node/image_raw', Image, image_callback)
    flag_sub = rospy.Subscriber('/flag_data', Float32 , flag_callback)
    car_line_pub = rospy.Publisher('/car_min_line', object, queue_size=10)
    out_image_pub = rospy.Publisher('/outimage', Image, queue_size= 1)
    rospy.spin()