ps aux | grep ros |  awk '{print $2}' | xargs kill -9

source ~/AGV-Auto/devel/setup.bash
roslaunch ~/AGV-Auto/full_stack.launch