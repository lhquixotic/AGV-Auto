# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nvidia/AGV-Auto/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nvidia/AGV-Auto/build

# Include any dependencies generated for this target.
include drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/depend.make

# Include the progress variables for this target.
include drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/progress.make

# Include the compile flags for this target's objects.
include drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/flags.make

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/flags.make
drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o: /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Magnetic.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/AGV-Auto/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o -c /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Magnetic.cpp

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/receiveprotocol.dir/Magnetic.cpp.i"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Magnetic.cpp > CMakeFiles/receiveprotocol.dir/Magnetic.cpp.i

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/receiveprotocol.dir/Magnetic.cpp.s"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Magnetic.cpp -o CMakeFiles/receiveprotocol.dir/Magnetic.cpp.s

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o.requires:

.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o.requires

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o.provides: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o.requires
	$(MAKE) -f drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/build.make drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o.provides.build
.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o.provides

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o.provides.build: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o


drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/flags.make
drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o: /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Motor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/AGV-Auto/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/receiveprotocol.dir/Motor.cpp.o -c /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Motor.cpp

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/receiveprotocol.dir/Motor.cpp.i"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Motor.cpp > CMakeFiles/receiveprotocol.dir/Motor.cpp.i

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/receiveprotocol.dir/Motor.cpp.s"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Motor.cpp -o CMakeFiles/receiveprotocol.dir/Motor.cpp.s

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o.requires:

.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o.requires

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o.provides: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o.requires
	$(MAKE) -f drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/build.make drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o.provides.build
.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o.provides

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o.provides.build: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o


drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/flags.make
drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o: /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Steer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/AGV-Auto/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/receiveprotocol.dir/Steer.cpp.o -c /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Steer.cpp

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/receiveprotocol.dir/Steer.cpp.i"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Steer.cpp > CMakeFiles/receiveprotocol.dir/Steer.cpp.i

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/receiveprotocol.dir/Steer.cpp.s"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/Steer.cpp -o CMakeFiles/receiveprotocol.dir/Steer.cpp.s

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o.requires:

.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o.requires

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o.provides: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o.requires
	$(MAKE) -f drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/build.make drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o.provides.build
.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o.provides

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o.provides.build: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o


drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/flags.make
drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o: /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/protocol.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/AGV-Auto/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/receiveprotocol.dir/protocol.cpp.o -c /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/protocol.cpp

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/receiveprotocol.dir/protocol.cpp.i"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/protocol.cpp > CMakeFiles/receiveprotocol.dir/protocol.cpp.i

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/receiveprotocol.dir/protocol.cpp.s"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol/protocol.cpp -o CMakeFiles/receiveprotocol.dir/protocol.cpp.s

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o.requires:

.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o.requires

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o.provides: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o.requires
	$(MAKE) -f drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/build.make drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o.provides.build
.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o.provides

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o.provides.build: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o


# Object files for target receiveprotocol
receiveprotocol_OBJECTS = \
"CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o" \
"CMakeFiles/receiveprotocol.dir/Motor.cpp.o" \
"CMakeFiles/receiveprotocol.dir/Steer.cpp.o" \
"CMakeFiles/receiveprotocol.dir/protocol.cpp.o"

# External object files for target receiveprotocol
receiveprotocol_EXTERNAL_OBJECTS =

/home/nvidia/AGV-Auto/devel/lib/libreceiveprotocol.so: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o
/home/nvidia/AGV-Auto/devel/lib/libreceiveprotocol.so: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o
/home/nvidia/AGV-Auto/devel/lib/libreceiveprotocol.so: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o
/home/nvidia/AGV-Auto/devel/lib/libreceiveprotocol.so: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o
/home/nvidia/AGV-Auto/devel/lib/libreceiveprotocol.so: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/build.make
/home/nvidia/AGV-Auto/devel/lib/libreceiveprotocol.so: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nvidia/AGV-Auto/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library /home/nvidia/AGV-Auto/devel/lib/libreceiveprotocol.so"
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/receiveprotocol.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/build: /home/nvidia/AGV-Auto/devel/lib/libreceiveprotocol.so

.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/build

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/requires: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Magnetic.cpp.o.requires
drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/requires: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Motor.cpp.o.requires
drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/requires: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/Steer.cpp.o.requires
drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/requires: drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/protocol.cpp.o.requires

.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/requires

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/clean:
	cd /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol && $(CMAKE_COMMAND) -P CMakeFiles/receiveprotocol.dir/cmake_clean.cmake
.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/clean

drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/depend:
	cd /home/nvidia/AGV-Auto/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nvidia/AGV-Auto/src /home/nvidia/AGV-Auto/src/drivers/canbus/canparse/include/protocol /home/nvidia/AGV-Auto/build /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol /home/nvidia/AGV-Auto/build/drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : drivers/canbus/canparse/include/protocol/CMakeFiles/receiveprotocol.dir/depend

