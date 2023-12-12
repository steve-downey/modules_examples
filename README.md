# Module Example Projects

The projects contained within this meta project are small examples pulled from various sources, including the C++ Standard. They can be built by the toplevel Makefile which drives CMake to build and link the modular interfaces and libraries.

If you have clang-16 available on your PATH, simply running `make` will build all of the sub-projects. To use clang-17 or gcc-14 you can use the invocations `make TOOLCHAIN=clang-17` or `make TOOLCHAIN=gcc-14` respectively. The flags used are defined in etc/clang-16-toolchain.cmake, etc.

## hello_world
This is the example provided in the announcement that the experimental phase of module support in CMake is complete. See https://www.kitware.com/import-cmake-the-experiment-is-over/

## example_1
This is the first example of modules in the C++ Standard, from [module.unit] 4 Example 1. https://eel.is/c++draft/module#unit-4

This has four translation units
- a primary module interface unit
- a module partition A:Foo
- a module partition A:Internals
- a module implementation unit
