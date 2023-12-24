cmake_minimum_required(VERSION 3.28)
project(interface_example_5 CXX)

# Turning off extensions avoids an issue with the clang 16 compiler
# clang 17 and greater can avoid this setting
set(CMAKE_CXX_EXTENSIONS OFF)
# Set the version of C++ for the project
set(CMAKE_CXX_STANDARD 20)
# Create a library
add_library(interface5)
# Add the module file to the library
target_sources(interface5
  PUBLIC
  FILE_SET CXX_MODULES FILES
  interface_unit.cpp
)

target_sources(interface5
  PUBLIC
      impl_unit.cpp
)

# Create an executable
add_executable(i5 main.cpp)
# Link to the library foo
target_link_libraries(i5 interface5)
