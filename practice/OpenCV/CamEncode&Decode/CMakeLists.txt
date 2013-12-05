project( ShowImg )
find_package( OpenCV REQUIRED)
add_executable( vedio vedio.cpp)
target_link_libraries( vedio ${OpenCV_LIBS} )
