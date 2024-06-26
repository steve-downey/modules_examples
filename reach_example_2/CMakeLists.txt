cmake_minimum_required(VERSION 3.28)
project(reach_example_2 CXX)
# https://eel.is/c++draft/module#unit-8

# Turning off extensions avoids an issue with the clang 16 compiler
# clang 17 and greater can avoid this setting
set(CMAKE_CXX_EXTENSIONS OFF)
# Set the version of C++ for the project
set(CMAKE_CXX_STANDARD 20)
# Create a library
add_library(reach2)
# Add the module file to the library
target_sources(reach2
  PUBLIC
    FILE_SET CXX_MODULES FILES
      tu1.cpp
)

target_sources(reach2
  PUBLIC
  tu2.cpp
)


# # Create an executable
# add_executable(example1 main.cpp)
# # Link to the library foo
# target_link_libraries(example1 ex1)
