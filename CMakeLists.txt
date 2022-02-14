cmake_minimum_required (VERSION 3.10.0)

project(
  mpreal
  VERSION 3.6.7
  LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 17)

find_package(GMP)
if (GMP_FOUND)
  message(STATUS "GMP found!")
else()
  message(WARNING "GMP not found!")
endif()

find_package(MPFR)
if (MPFR_FOUND)
  message(STATUS "MPFR found!")
else()
  message(WARNING "MPFR not found!")
endif()

set(HAVE_MPREAL FALSE CACHE BOOL "Have working mpreal" FORCE)
if (GMP_FOUND AND MPFR_FOUND)
  set(HAVE_MPREAL TRUE CACHE BOOL "Have working mpreal" FORCE)
  message(STATUS "MPReal enabled!")

  add_library(mpreal INTERFACE)
  target_include_directories(mpreal INTERFACE .)

  add_executable(mpreal_example example/example.cpp)
  target_link_libraries(mpreal_example mpreal mpfr)
else()
  message(WARNING "MPReal not enabled!")
endif()
