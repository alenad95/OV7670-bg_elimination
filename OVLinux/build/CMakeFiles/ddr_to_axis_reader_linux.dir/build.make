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
include CMakeFiles/ddr_to_axis_reader_linux.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ddr_to_axis_reader_linux.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ddr_to_axis_reader_linux.dir/flags.make

CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o: CMakeFiles/ddr_to_axis_reader_linux.dir/flags.make
CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o: ../src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/OVLinux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o   -c /home/ubuntu/OVLinux/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c

CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/OVLinux/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c > CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.i

CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/OVLinux/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c -o CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.s

CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o.requires:

.PHONY : CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o.requires

CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o.provides: CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o.requires
	$(MAKE) -f CMakeFiles/ddr_to_axis_reader_linux.dir/build.make CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o.provides.build
.PHONY : CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o.provides

CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o.provides.build: CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o


# Object files for target ddr_to_axis_reader_linux
ddr_to_axis_reader_linux_OBJECTS = \
"CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o"

# External object files for target ddr_to_axis_reader_linux
ddr_to_axis_reader_linux_EXTERNAL_OBJECTS =

libddr_to_axis_reader_linux.so: CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o
libddr_to_axis_reader_linux.so: CMakeFiles/ddr_to_axis_reader_linux.dir/build.make
libddr_to_axis_reader_linux.so: CMakeFiles/ddr_to_axis_reader_linux.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/OVLinux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library libddr_to_axis_reader_linux.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ddr_to_axis_reader_linux.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ddr_to_axis_reader_linux.dir/build: libddr_to_axis_reader_linux.so

.PHONY : CMakeFiles/ddr_to_axis_reader_linux.dir/build

CMakeFiles/ddr_to_axis_reader_linux.dir/requires: CMakeFiles/ddr_to_axis_reader_linux.dir/src/drivers/src/ddr_to_axis_reader_v1_0/xddr_to_axis_reader_linux.c.o.requires

.PHONY : CMakeFiles/ddr_to_axis_reader_linux.dir/requires

CMakeFiles/ddr_to_axis_reader_linux.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ddr_to_axis_reader_linux.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ddr_to_axis_reader_linux.dir/clean

CMakeFiles/ddr_to_axis_reader_linux.dir/depend:
	cd /home/ubuntu/OVLinux/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/OVLinux /home/ubuntu/OVLinux /home/ubuntu/OVLinux/build /home/ubuntu/OVLinux/build /home/ubuntu/OVLinux/build/CMakeFiles/ddr_to_axis_reader_linux.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ddr_to_axis_reader_linux.dir/depend

