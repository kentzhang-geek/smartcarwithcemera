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
CMAKE_SOURCE_DIR = /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW

# Include any dependencies generated for this target.
include CMakeFiles/showimg.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/showimg.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/showimg.dir/flags.make

CMakeFiles/showimg.dir/showimg.o: CMakeFiles/showimg.dir/flags.make
CMakeFiles/showimg.dir/showimg.o: showimg.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/showimg.dir/showimg.o"
	/home/kent/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/showimg.dir/showimg.o -c /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW/showimg.cpp

CMakeFiles/showimg.dir/showimg.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/showimg.dir/showimg.i"
	/home/kent/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW/showimg.cpp > CMakeFiles/showimg.dir/showimg.i

CMakeFiles/showimg.dir/showimg.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/showimg.dir/showimg.s"
	/home/kent/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW/showimg.cpp -o CMakeFiles/showimg.dir/showimg.s

CMakeFiles/showimg.dir/showimg.o.requires:
.PHONY : CMakeFiles/showimg.dir/showimg.o.requires

CMakeFiles/showimg.dir/showimg.o.provides: CMakeFiles/showimg.dir/showimg.o.requires
	$(MAKE) -f CMakeFiles/showimg.dir/build.make CMakeFiles/showimg.dir/showimg.o.provides.build
.PHONY : CMakeFiles/showimg.dir/showimg.o.provides

CMakeFiles/showimg.dir/showimg.o.provides.build: CMakeFiles/showimg.dir/showimg.o

# Object files for target showimg
showimg_OBJECTS = \
"CMakeFiles/showimg.dir/showimg.o"

# External object files for target showimg
showimg_EXTERNAL_OBJECTS =

showimg: CMakeFiles/showimg.dir/showimg.o
showimg: CMakeFiles/showimg.dir/build.make
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_videostab.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_video.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_ts.a
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_superres.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_stitching.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_photo.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_ocl.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_objdetect.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_nonfree.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_ml.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_legacy.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_imgproc.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_highgui.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_gpu.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_flann.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_features2d.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_core.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_contrib.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_calib3d.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_nonfree.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_ocl.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_gpu.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_photo.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_objdetect.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_legacy.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_video.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_ml.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_calib3d.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_features2d.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_highgui.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_imgproc.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_flann.so.2.4.7
showimg: /home/kent/桌面/tmp/opencv-2.4.7/lib/libopencv_core.so.2.4.7
showimg: CMakeFiles/showimg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable showimg"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/showimg.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/showimg.dir/build: showimg
.PHONY : CMakeFiles/showimg.dir/build

CMakeFiles/showimg.dir/requires: CMakeFiles/showimg.dir/showimg.o.requires
.PHONY : CMakeFiles/showimg.dir/requires

CMakeFiles/showimg.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/showimg.dir/cmake_clean.cmake
.PHONY : CMakeFiles/showimg.dir/clean

CMakeFiles/showimg.dir/depend:
	cd /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW /home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/ImageRW/CMakeFiles/showimg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/showimg.dir/depend
