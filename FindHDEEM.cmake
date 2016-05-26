# FindHDEEM - tries to find the hdeem library.
#
# -------------------------------------------------------------------------------------------------
#
# On success, this module defines the following variables:
#   HDEEM_INCLUDE_DIRS              -   The path to find hdeem.h in.
#   HDEEM_LIBRARIES                 -   The path to find libhdeem.so in.
#
# This module will try to find hdeem in some standard paths but you can give a hint with the
# following variable:
#   HDEEM_ROOT_DIR                  -   A path to look for hdeem. Can be set as a parameter for
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
set(_hdeem_HEADER_SEARCH_DIRS
        "/usr/include"
        "/usr/include/hdeem"
        "/usr/local/include"
        "/usr/local/include/hdeem")
set(_hdeem_LIBRARY_SEARCH_DIRS
        "/usr/lib/"
        "/usr/lib64/")

# Environment variable
set(_hdeem_ENV_ROOT_DIR "$ENV{HDEEM_ROOT_DIR}")

# If only the environment variable is given, override CMake parameter.
if(NOT HDEEM_ROOT_DIR AND _hdeem_ENV_ROOT_DIR)
    set(HDEEM_ROOT_DIR "${_hdeem_ENV_ROOT_DIR}")
endif()

# Search in the user given locations at first.
if(HDEEM_ROOT_DIR)
    set(_hdeem_HEADER_SEARCH_DIRS "${HDEEM_ROOT_DIR}"
                                  "${HDEEM_ROOT_DIR}/include"
                                  "{_hdeem_HEADER_SEARCH_DIRS}")
    set(_hdeem_LIBRARY_SEARCH_DIRS "${HDEEM_ROOT_DIR}"
                                   "{_hdeem_HEADER_SEARCH_DIRS}")
endif()

# Now find that header and that library!
find_path(HDEEM_INCLUDE_DIR "hdeem.h" PATHS ${_hdeem_HEADER_SEARCH_DIRS})
find_library(HDEEM_LIBRARY NAMES "libhdeem" "hdeem" HINTS ${_hdeem_LIBRARY_SEARCH_DIRS})

# Handle the standard args
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(HDEEM DEFAULT_MSG HDEEM_LIBRARY HDEEM_INCLUDE_DIR)

mark_as_advanced(HDEEM_INCLUDE_DIR HDEEM_LIBRARY)
set(HDEEM_LIBRARIES "${HDEEM_LIBRARY}")
set(HDEEM_INCLUDE_DIRS "${HDEEM_INCLUDE_DIR}")
