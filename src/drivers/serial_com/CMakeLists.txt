cmake_minimum_required(VERSION 2.8.3)
project(serial_com)

add_compile_options(-std=c++11)

set(PROJECT_DEPS
  roscpp
  std_msgs
  serial
  nmea_msgs
  common_msgs
  )

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  geometry_msgs
  serial
  nmea_msgs
  common_msgs
  )

catkin_package(
  INCLUDE_DIRS
  LIBRARIES
  CATKIN_DEPENDS
  DEPENDS
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${roscpp_INCLUDE_DIRS}
)

# Each node in the package must be declared like this
add_executable(${PROJECT_NAME}
  src/serial_com_handle.cpp
  src/serial_com.cpp
  src/main.cpp
  )

add_dependencies(${PROJECT_NAME} ${catkin_EXPORTED_TARGETS})

target_link_libraries(${PROJECT_NAME}
  ${catkin_LIBRARIES}
  )
