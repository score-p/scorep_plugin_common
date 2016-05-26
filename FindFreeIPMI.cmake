# FindFreeIPMI - tries to find the FreeIPMI library.
#
# -------------------------------------------------------------------------------------------------
#
# On success, this module defines the following variables:
#   FreeIPMI_INCLUDE_DIRS           -   The path to find freeIPMI.h in.
#   FreeIPMI_LIBRARIES              -   The path to find libfreeIPMI.so in.
#
# This module will try to find freeIPMI in some standard paths but you can give a hint with the
# following variable:
#   FreeIPMI_ROOT_DIR               -   A path to look for freeIPMI. Can be set as a parameter for
#                                       CMake or as an environment variable.
#
# -------------------------------------------------------------------------------------------------
#
# Copyright (c) 2016, Technische Universität Dresden
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted
# provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions
#    and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of
#    conditions and the following disclaimer in the documentation and/or other materials provided
#    with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to
#    endorse or promote products derived from this software without specific prior written
#    permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# -------------------------------------------------------------------------------------------------

# Default search paths
set(_freeIPMI_HEADER_SEARCH_DIRS
        "/usr/include"
        "/usr/include/freeipmi"
        "/usr/local/include"
        "/usr/local/include/freeipmi")
set(_freeIPMI_LIBRARY_SEARCH_DIRS
        "/usr/lib/"
        "/usr/lib64/")

# Environment variable
set(_freeIPMI_ENV_ROOT_DIR "$ENV{FreeIPMI_ROOT_DIR}")

# If only the environment variable is given, override CMake parameter.
if(NOT FreeIPMI_ROOT_DIR AND _freeIPMI_ENV_ROOT_DIR)
    set(FreeIPMI_ROOT_DIR "${_freeIPMI_ENV_ROOT_DIR}")
endif()

# Search in the user given locations at first.
if(FreeIPMI_ROOT_DIR)
    set(_freeIPMI_HEADER_SEARCH_DIRS "${FreeIPMI_ROOT_DIR}"
                                     "${FreeIPMI_ROOT_DIR}/include"
                                     "{_freeIPMI_HEADER_SEARCH_DIRS}")
    set(_freeIPMI_LIBRARY_SEARCH_DIRS "${FreeIPMI_ROOT_DIR}"
                                      "{_freeIPMI_HEADER_SEARCH_DIRS}")
endif()

# Now find that header and that library!
find_path(FreeIPMI_INCLUDE_DIR "freeipmi.h" PATHS ${_freeIPMI_HEADER_SEARCH_DIRS})
find_library(FreeIPMI_LIBRARY NAMES "libfreeipmi" "freeipmi" HINTS ${_freeIPMI_LIBRARY_SEARCH_DIRS})

# Handle the standard args
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FreeIPMI DEFAULT_MSG FreeIPMI_LIBRARY FreeIPMI_INCLUDE_DIR)

mark_as_advanced(FreeIPMI_INCLUDE_DIR FreeIPMI_LIBRARY)
set(FreeIPMI_LIBRARIES "${FreeIPMI_LIBRARY}")
set(FreeIPMI_INCLUDE_DIRS "${FreeIPMI_INCLUDE_DIR}")
