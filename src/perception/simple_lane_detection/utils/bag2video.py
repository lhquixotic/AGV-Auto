import rosbag
import cv2
import os, glob
from cv_bridge import CvBridge

bag_dir = '/home/wuxz/data/lane_Data'
# bag_files = glob.glob(os.path.join(bag_dir, '*.bag'))
bag_files = [os.path.join(bag_dir, '20230815_063537.bag')]
video_dir = '/home/wuxz/data/lane_Data/videos'

for bag_file in bag_files:
    video_name = os.path.basename(bag_file)[:-3]+'mp4'
    video_file = os.path.join(video_dir, video_name)
    fps = 15; size = (640, 480)
    videoWriter = cv2.VideoWriter(video_file, cv2.VideoWriter_fourcc('M','P','E','G'), fps, size)
    bag = rosbag.Bag(bag_file)
    data = list(bag.read_messages('/device_0/sensor_1/Color_0/image/data'))
    for i in range(len(data)):
        bridge = CvBridge()
        cv_image = bridge.imgmsg_to_cv2(data[i][1])
        videoWriter.write(cv_image[:,:,[2,1,0]])
    videoWriter.release()
