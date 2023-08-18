#!/bin/bash
CONFIG_MTTCAN=m
echo 'nvidia' | sudo -S modprobe can
echo 'nvidia' | sudo -S modprobe can_raw
echo 'nvidia' | sudo -S modprobe mttcan
echo 'nvidia' | sudo -S ip link set can0 type can bitrate 500000
echo 'nvidia' | sudo -S ip link set up can0
echo 'can device init done!'
echo 'nvidia' | sudo -S chmod 777 /dev/ttyTHS1
echo 'nvidia' | sudo -S chmod 777 /dev/ttyTHS0
echo 'nvidia' | sudo -S chmod 777 /dev/ttyUSB1
echo 'nvidia' | sudo -S chmod 777 /dev/ttyUSB0
echo 'nvidia' | sudo -S chmod 777 /dev/ttyUSB2
echo 'serial com device init done!'
python /home/nvidia/AGV-Auto/setup_gpio.py

source /home/nvidia/AGV-Auto/devel/setup.bash

roslaunch /home/nvidia/AGV-Auto/full_stack.launch

exit 0
