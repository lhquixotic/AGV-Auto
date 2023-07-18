#include <ros/ros.h>
#include "serial_com.hpp"
#include <sstream>

namespace ns_serial_com {
// Constructor
SerialCom::SerialCom(ros::NodeHandle &nh) : nh_(nh) {

};

// Getters
// nmea_msgs::Sentence SerialCom::getSerialInfo(){return sentence;}
common_msgs::SerialMsg SerialCom::getSerialInfo(){return serial_msg;}

// Setters
void SerialCom::setSerialParameters(const Para &msg){
  serial_para = msg;
}

// Methods
void SerialCom::initializeSerial(){
  // Parameters initialization
  serial::Timeout to = serial::Timeout::simpleTimeout(1000);
  sp.setPort(serial_para.port);
  sp.setBaudrate(serial_para.baud);
  sp.setTimeout(to);

  // Check the serial port
  try{
    sp.open();
  }
  catch(serial::IOException &e){
    ROS_WARN_STREAM("Fail to open serial port!");
  }

  if(sp.isOpen()){
    ROS_INFO("Serial initialized success!");
    if(serial_para.device=="rfid"){
      uint8_t init_msg[] = {0x02,0x07,0x07,0x4a,0xcf,0xa1,0x00,0x05,0x01,0x5a,0x7a,0x03};
      sp.write(init_msg,12); 
      ROS_INFO("[Serial Com] RFID device, initialization message sent!");
    }
  }
  else{
    ROS_WARN("Serial initialization failed, not open!");
  }
}

void SerialCom::runAlgorithm() {
  if(sp.isOpen()){
    // read byte number from buffer
    size_t n = sp.available();
    if (n!=0){
      uint8_t buffer[1024];
      // read data
      n = sp.read(buffer,n);

      serial_msg.header.frame_id = 'serial';
      serial_msg.header.stamp = ros::Time::now();
      // serial_msg.data = buffer;
      serial_msg.length = n;

      for(int i=0;i<n;i++){
        // uint dd = buffer[i];
        serial_msg.data[i] = buffer[i];
        // serial_msg.data[i] = dd;
        // std::cout << std::hex << (buffer[i] & 0xff) << " ";
        // std::cout << std::hex << (dd & 0xff) << " ";
        // serial_msg.data[i] = buffer[i];
      }
      // std::cout << std::endl;
      sp.write(buffer,n);

    }
  }
  else{
    ROS_WARN_STREAM("Serial not opened.");
    sp.close();
    ROS_WARN_STREAM("Serial is closed.");
  }
}

std::string& SerialCom::trim(std::string &s){
	if (!s.empty()) {
		s = s.erase(0, s.find_first_not_of(" "));
		s = s.erase(s.find_last_not_of(" ") + 1);
	}
	else {
		return s;
	}
	// blank inside string 
	if (!s.empty()) {
		std::string::size_type i = 0;
		while ( (i = s.find(' ')) != std::string::npos ) {
			s.erase(i, 1);
		}
	}
	else {
		return s;
	}
	return s;
}

// TODO:whether add function to shut the port down
}
