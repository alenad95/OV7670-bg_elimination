# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/ubuntu/OVLinux

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/OVLinux/build

# Include any dependencies generated for this target.
include CMakeFiles/ov7670Start.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ov7670Start.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ov7670Start.dir/flags.make

CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o: CMakeFiles/ov7670Start.dir/flags.make
CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o: ../src/daemon/src/Start.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/OVLinux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o -c /home/ubuntu/OVLinux/src/daemon/src/Start.cpp

CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/OVLinux/src/daemon/src/Start.cpp > CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.i

CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/OVLinux/src/daemon/src/Start.cpp -o CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.s

CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o.requires:

.PHONY : CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o.requires

CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o.provides: CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o.requires
	$(MAKE) -f CMakeFiles/ov7670Start.dir/build.make CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o.provides.build
.PHONY : CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o.provides

CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o.provides.build: CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o


CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o: CMakeFiles/ov7670Start.dir/flags.make
CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o: ../src/common/src/axis_to_ddr_writer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/OVLinux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o -c /home/ubuntu/OVLinux/src/common/src/axis_to_ddr_writer.cpp

CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/OVLinux/src/common/src/axis_to_ddr_writer.cpp > CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.i

CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/OVLinux/src/common/src/axis_to_ddr_writer.cpp -o CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.s

CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o.requires:

.PHONY : CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o.requires

CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o.provides: CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o.requires
	$(MAKE) -f CMakeFiles/ov7670Start.dir/build.make CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o.provides.build
.PHONY : CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o.provides

CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o.provides.build: CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o


CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o: CMakeFiles/ov7670Start.dir/flags.make
CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o: ../src/common/src/ddr_to_axis_reader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/OVLinux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o -c /home/ubuntu/OVLinux/src/common/src/ddr_to_axis_reader.cpp

CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/OVLinux/src/common/src/ddr_to_axis_reader.cpp > CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.i

CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/OVLinux/src/common/src/ddr_to_axis_reader.cpp -o CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.s

CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o.requires:

.PHONY : CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o.requires

CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o.provides: CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o.requires
	$(MAKE) -f CMakeFiles/ov7670Start.dir/build.make CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o.provides.build
.PHONY : CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o.provides

CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o.provides.build: CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o


CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o: CMakeFiles/ov7670Start.dir/flags.make
CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o: ../src/common/src/gpio_intr.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/OVLinux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o -c /home/ubuntu/OVLinux/src/common/src/gpio_intr.cpp

CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/OVLinux/src/common/src/gpio_intr.cpp > CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.i

CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/OVLinux/src/common/src/gpio_intr.cpp -o CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.s

CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o.requires:

.PHONY : CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o.requires

CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o.provides: CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o.requires
	$(MAKE) -f CMakeFiles/ov7670Start.dir/build.make CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o.provides.build
.PHONY : CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o.provides

CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o.provides.build: CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o


# Object files for target ov7670Start
ov7670Start_OBJECTS = \
"CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o" \
"CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o" \
"CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o" \
"CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o"

# External object files for target ov7670Start
ov7670Start_EXTERNAL_OBJECTS =

ov7670Start: CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o
ov7670Start: CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o
ov7670Start: CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o
ov7670Start: CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o
ov7670Start: CMakeFiles/ov7670Start.dir/build.make
ov7670Start: libddr_to_axis_reader_linux.so
ov7670Start: libddr_to_axis_reader.so
ov7670Start: libaxis_to_ddr_writer_linux.so
ov7670Start: libaxis_to_ddr_writer.so
ov7670Start: libgpio.so
ov7670Start: libgpio_linux.so
ov7670Start: CMakeFiles/ov7670Start.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/OVLinux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable ov7670Start"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ov7670Start.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ov7670Start.dir/build: ov7670Start

.PHONY : CMakeFiles/ov7670Start.dir/build

CMakeFiles/ov7670Start.dir/requires: CMakeFiles/ov7670Start.dir/src/daemon/src/Start.cpp.o.requires
CMakeFiles/ov7670Start.dir/requires: CMakeFiles/ov7670Start.dir/src/common/src/axis_to_ddr_writer.cpp.o.requires
CMakeFiles/ov7670Start.dir/requires: CMakeFiles/ov7670Start.dir/src/common/src/ddr_to_axis_reader.cpp.o.requires
CMakeFiles/ov7670Start.dir/requires: CMakeFiles/ov7670Start.dir/src/common/src/gpio_intr.cpp.o.requires

.PHONY : CMakeFiles/ov7670Start.dir/requires

CMakeFiles/ov7670Start.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ov7670Start.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ov7670Start.dir/clean

CMakeFiles/ov7670Start.dir/depend:
	cd /home/ubuntu/OVLinux/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/OVLinux /home/ubuntu/OVLinux /home/ubuntu/OVLinux/build /home/ubuntu/OVLinux/build /home/ubuntu/OVLinux/build/CMakeFiles/ov7670Start.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ov7670Start.dir/depend

