
ps aux | grep ros | awk '{print $2}' | xargs kill -9

source /home/nvidia/AGV-Auto/devel/setup.bash
roslaunch /home/nvidia/AGV-Auto/full_stack.launch