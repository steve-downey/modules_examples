cmake_minimum_required(VERSION 3.28)
project(pmf_example_1 CXX)

# Turning off extensions avoids an issue with the clang 16 compiler
# clang 17 and greater can avoid this setting
set(CMAKE_CXX_EXTENSIONS OFF)
# Set the version of C++ for the project
set(CMAKE_CXX_STANDARD 20)
# Create a library
add_library(pmf1)
# Add the module file to the library
target_sources(pmf1
  PUBLIC
    FILE_SET CXX_MODULES FILES
    a.cpp
)
