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
CMAKE_SOURCE_DIR = "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode"

# Include any dependencies generated for this target.
include CMakeFiles/vedio.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/vedio.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vedio.dir/flags.make

CMakeFiles/vedio.dir/vedio.o: CMakeFiles/vedio.dir/flags.make
CMakeFiles/vedio.dir/vedio.o: vedio.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode/CMakeFiles" $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/vedio.dir/vedio.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/vedio.dir/vedio.o -c "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode/vedio.cpp"

CMakeFiles/vedio.dir/vedio.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vedio.dir/vedio.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode/vedio.cpp" > CMakeFiles/vedio.dir/vedio.i

CMakeFiles/vedio.dir/vedio.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vedio.dir/vedio.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode/vedio.cpp" -o CMakeFiles/vedio.dir/vedio.s

CMakeFiles/vedio.dir/vedio.o.requires:
.PHONY : CMakeFiles/vedio.dir/vedio.o.requires

CMakeFiles/vedio.dir/vedio.o.provides: CMakeFiles/vedio.dir/vedio.o.requires
	$(MAKE) -f CMakeFiles/vedio.dir/build.make CMakeFiles/vedio.dir/vedio.o.provides.build
.PHONY : CMakeFiles/vedio.dir/vedio.o.provides

CMakeFiles/vedio.dir/vedio.o.provides.build: CMakeFiles/vedio.dir/vedio.o

# Object files for target vedio
vedio_OBJECTS = \
"CMakeFiles/vedio.dir/vedio.o"

# External object files for target vedio
vedio_EXTERNAL_OBJECTS =

vedio: CMakeFiles/vedio.dir/vedio.o
vedio: CMakeFiles/vedio.dir/build.make
vedio: /home/kent/opencv/lib/libopencv_videostab.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_video.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_ts.a
vedio: /home/kent/opencv/lib/libopencv_superres.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_stitching.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_photo.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_ocl.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_objdetect.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_nonfree.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_ml.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_legacy.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_imgproc.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_highgui.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_gpu.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_flann.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_features2d.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_core.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_contrib.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_calib3d.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_nonfree.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_ocl.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_gpu.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_photo.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_objdetect.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_legacy.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_video.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_ml.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_calib3d.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_features2d.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_highgui.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_imgproc.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_flann.so.2.4.7
vedio: /home/kent/opencv/lib/libopencv_core.so.2.4.7
vedio: CMakeFiles/vedio.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable vedio"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vedio.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vedio.dir/build: vedio
.PHONY : CMakeFiles/vedio.dir/build

CMakeFiles/vedio.dir/requires: CMakeFiles/vedio.dir/vedio.o.requires
.PHONY : CMakeFiles/vedio.dir/requires

CMakeFiles/vedio.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vedio.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vedio.dir/clean

CMakeFiles/vedio.dir/depend:
	cd "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode" "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode" "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode" "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode" "/home/kent/桌面/tmp/smartcarwithcemera/practice/OpenCV/CamEncode&Decode/CMakeFiles/vedio.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/vedio.dir/depend
