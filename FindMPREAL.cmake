# Try to find the MPREAL library
#
# This module supports requiring a minimum version, e.g. you can do
#   find_package(MPREAL 2.3.0)
# to require version 2.3.0 to newer of MPREAL.
#
# Once done this will define
#
#  MPREAL_FOUND - system has MPREAL lib with correct version
#  MPREAL_INCLUDES - the MPREAL include directory
#  MPREAL_LIBRARIES - the MPREAL library
#  MPREAL_VERSION - MPREAL version

# Copyright (c) 2006, 2007 Montel Laurent, <montel@kde.org>
# Copyright (c) 2008, 2009 Gael Guennebaud, <g.gael@free.fr>
# Copyright (c) 2010 Jitse Niesen, <jitse@maths.leeds.ac.uk>
# Copyright (c) 2020, 2023 Pavel Holoborodko, <pavel@holoborodko.com>
# Redistribution and use is allowed according to the terms of the BSD license.

# Set MPREAL_INCLUDES

find_path(MPREAL_INCLUDES
  NAMES
  mpreal.h
  PATHS
  $ENV{GMPDIR}
  ${INCLUDE_INSTALL_DIR}
)

# Set MPREAL_FIND_VERSION to 1.0.0 if no minimum version is specified

if(NOT MPREAL_FIND_VERSION)
  if(NOT MPREAL_FIND_VERSION_MAJOR)
    set(MPREAL_FIND_VERSION_MAJOR 1)
  endif(NOT MPREAL_FIND_VERSION_MAJOR)
  if(NOT MPREAL_FIND_VERSION_MINOR)
    set(MPREAL_FIND_VERSION_MINOR 0)
  endif(NOT MPREAL_FIND_VERSION_MINOR)
  if(NOT MPREAL_FIND_VERSION_PATCH)
    set(MPREAL_FIND_VERSION_PATCH 0)
  endif(NOT MPREAL_FIND_VERSION_PATCH)

  set(MPREAL_FIND_VERSION "${MPREAL_FIND_VERSION_MAJOR}.${MPREAL_FIND_VERSION_MINOR}.${MPREAL_FIND_VERSION_PATCH}")
endif(NOT MPREAL_FIND_VERSION)


if(MPREAL_INCLUDES)

  # Set MPREAL_VERSION
  
  file(READ "${MPREAL_INCLUDES}/mpreal.h" _mpfr_version_header)
  
  string(REGEX MATCH "define[ \t]+MPREAL_VERSION_MAJOR[ \t]+([0-9]+)" _mpfr_major_version_match "${_mpfr_version_header}")
  set(MPREAL_MAJOR_VERSION "${CMAKE_MATCH_1}")
  string(REGEX MATCH "define[ \t]+MPREAL_VERSION_MINOR[ \t]+([0-9]+)" _mpfr_minor_version_match "${_mpfr_version_header}")
  set(MPREAL_MINOR_VERSION "${CMAKE_MATCH_1}")
  string(REGEX MATCH "define[ \t]+MPREAL_VERSION_PATCHLEVEL[ \t]+([0-9]+)" _mpfr_patchlevel_version_match "${_mpfr_version_header}")
  set(MPREAL_PATCHLEVEL_VERSION "${CMAKE_MATCH_1}")
  
  set(MPREAL_VERSION ${MPREAL_MAJOR_VERSION}.${MPREAL_MINOR_VERSION}.${MPREAL_PATCHLEVEL_VERSION})
  
  # Check whether found version exceeds minimum version
  
  if(${MPREAL_VERSION} VERSION_LESS ${MPREAL_FIND_VERSION})
    set(MPREAL_VERSION_OK FALSE)
    message(STATUS "MPREAL version ${MPREAL_VERSION} found in ${MPREAL_INCLUDES}, "
                   "but at least version ${MPREAL_FIND_VERSION} is required")
  else(${MPREAL_VERSION} VERSION_LESS ${MPREAL_FIND_VERSION})
    set(MPREAL_VERSION_OK TRUE)
  endif(${MPREAL_VERSION} VERSION_LESS ${MPREAL_FIND_VERSION})

endif(MPREAL_INCLUDES)

# Set MPREAL_LIBRARIES

find_library(MPREAL_LIBRARIES mpreal PATHS $ENV{GMPDIR} ${LIB_INSTALL_DIR})

# Epilogue

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MPREAL DEFAULT_MSG
                                  MPREAL_INCLUDES MPREAL_LIBRARIES MPREAL_VERSION_OK)
mark_as_advanced(MPREAL_INCLUDES MPREAL_LIBRARIES)
