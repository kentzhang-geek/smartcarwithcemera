project( camserver )
find_package( OpenCV REQUIRED)
add_executable( camserver camserver.cpp )
target_link_libraries( camserver ${OpenCV_LIBS} )
