project( camclient )
find_package( OpenCV REQUIRED)
add_executable( camclient camclient.cpp)
target_link_libraries( camclient ${OpenCV_LIBS} )
