cmake_minimum_required(VERSION 3.28)
project(interface_example_1 CXX)

# Turning off extensions avoids an issue with the clang 16 compiler
# clang 17 and greater can avoid this setting
set(CMAKE_CXX_EXTENSIONS OFF)
# Set the version of C++ for the project
set(CMAKE_CXX_STANDARD 20)
# Create a library
add_library(m1)
# Add the module file to the library
target_sources(m1
  PUBLIC
    FILE_SET CXX_MODULES FILES
      m1.cpp
)

# Create a library
add_library(m2)
# Add the module file to the library
target_sources(m2
  PUBLIC
    FILE_SET CXX_MODULES FILES
      m2.cpp
)


# Create a library
add_library(m3)
# Add the module file to the library
target_sources(m3
  PUBLIC
    FILE_SET CXX_MODULES FILES
      m3.cpp
)
