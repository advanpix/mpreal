cmake_minimum_required (VERSION 3.10.0)

project(
  mpreal
  VERSION 3.6.7
  LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 17)

add_library(mpreal INTERFACE)
target_include_directories(mpreal INTERFACE .)

add_executable(mpreal_example example/example.cpp)
target_link_libraries(mpreal_example mpreal mpfr)
