CONFIG_MTTCAN=m
echo 'nvidia' | sudo -S modprobe can
echo 'nvidia' | sudo -S modprobe can_raw
echo 'nvidia' | sudo -S modprobe mttcan
echo 'nvidia' | sudo -S ip link set can0 type can bitrate 500000
echo 'nvidia' | sudo -S ip link set up can0
echo 'nvidia' | sudo -S ip link set can1 type can bitrate 250000
echo 'nvidia' | sudo -S ip link set up can1
echo 'can device init done!'
echo 'nvidia' | sudo -S chmod 777 /dev/ttyTHS1
echo 'nvidia' | sudo -S chmod 777 /dev/ttyTHS0
echo 'nvidia' | sudo -S chmod 777 /dev/ttyTHS4
echo 'serial com device init done!'
