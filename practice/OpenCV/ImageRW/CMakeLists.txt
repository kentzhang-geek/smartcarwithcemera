project( ShowImg )
find_package( OpenCV REQUIRED)
add_executable( showimg showimg.cpp)
target_link_libraries( showimg ${OpenCV_LIBS} )
