# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kent/桌面/tmp/smartcarwithcemera/videostream/client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kent/桌面/tmp/smartcarwithcemera/videostream/client

# Include any dependencies generated for this target.
include CMakeFiles/camclient.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/camclient.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/camclient.dir/flags.make

CMakeFiles/camclient.dir/camclient.o: CMakeFiles/camclient.dir/flags.make
CMakeFiles/camclient.dir/camclient.o: camclient.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kent/桌面/tmp/smartcarwithcemera/videostream/client/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/camclient.dir/camclient.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/camclient.dir/camclient.o -c /home/kent/桌面/tmp/smartcarwithcemera/videostream/client/camclient.cpp

CMakeFiles/camclient.dir/camclient.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camclient.dir/camclient.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kent/桌面/tmp/smartcarwithcemera/videostream/client/camclient.cpp > CMakeFiles/camclient.dir/camclient.i

CMakeFiles/camclient.dir/camclient.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camclient.dir/camclient.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kent/桌面/tmp/smartcarwithcemera/videostream/client/camclient.cpp -o CMakeFiles/camclient.dir/camclient.s

CMakeFiles/camclient.dir/camclient.o.requires:
.PHONY : CMakeFiles/camclient.dir/camclient.o.requires

CMakeFiles/camclient.dir/camclient.o.provides: CMakeFiles/camclient.dir/camclient.o.requires
	$(MAKE) -f CMakeFiles/camclient.dir/build.make CMakeFiles/camclient.dir/camclient.o.provides.build
.PHONY : CMakeFiles/camclient.dir/camclient.o.provides

CMakeFiles/camclient.dir/camclient.o.provides.build: CMakeFiles/camclient.dir/camclient.o

# Object files for target camclient
camclient_OBJECTS = \
"CMakeFiles/camclient.dir/camclient.o"

# External object files for target camclient
camclient_EXTERNAL_OBJECTS =

camclient: CMakeFiles/camclient.dir/camclient.o
camclient: CMakeFiles/camclient.dir/build.make
camclient: /home/kent/opencv/lib/libopencv_videostab.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_video.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_ts.a
camclient: /home/kent/opencv/lib/libopencv_superres.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_stitching.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_photo.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_ocl.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_objdetect.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_nonfree.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_ml.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_legacy.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_imgproc.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_highgui.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_gpu.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_flann.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_features2d.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_core.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_contrib.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_calib3d.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_nonfree.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_ocl.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_gpu.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_photo.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_objdetect.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_legacy.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_video.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_ml.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_calib3d.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_features2d.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_highgui.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_imgproc.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_flann.so.2.4.7
camclient: /home/kent/opencv/lib/libopencv_core.so.2.4.7
camclient: CMakeFiles/camclient.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable camclient"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/camclient.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/camclient.dir/build: camclient
.PHONY : CMakeFiles/camclient.dir/build

CMakeFiles/camclient.dir/requires: CMakeFiles/camclient.dir/camclient.o.requires
.PHONY : CMakeFiles/camclient.dir/requires

CMakeFiles/camclient.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/camclient.dir/cmake_clean.cmake
.PHONY : CMakeFiles/camclient.dir/clean

CMakeFiles/camclient.dir/depend:
	cd /home/kent/桌面/tmp/smartcarwithcemera/videostream/client && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kent/桌面/tmp/smartcarwithcemera/videostream/client /home/kent/桌面/tmp/smartcarwithcemera/videostream/client /home/kent/桌面/tmp/smartcarwithcemera/videostream/client /home/kent/桌面/tmp/smartcarwithcemera/videostream/client /home/kent/桌面/tmp/smartcarwithcemera/videostream/client/CMakeFiles/camclient.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/camclient.dir/depend

