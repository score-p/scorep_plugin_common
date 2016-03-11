# Copyright (c) 2016, Technische Universität Dresden, Germany
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted
# provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions
#    and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions
#    and the following disclaimer in the documentation and/or other materials provided with the
#    distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse
#    or promote products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
# THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

find_path(VT_DIR vtrun HINTS /opt/vampirtrace ${VT_DIR} ENV PATH PATH_SUFFIXES bin DOC "Path to vampirtrace root folder")

if( VT_DIR )

    get_filename_component(VT_ROOT_PATH "${VT_DIR}/../" ABSOLUTE)
    get_filename_component(VT_BIN_PATH "${VT_ROOT_PATH}/bin/" ABSOLUTE)
    get_filename_component(VT_LIBRARY_PATH "${VT_ROOT_PATH}/lib/" ABSOLUTE)
    get_filename_component(VT_INCLUDE_PATH "${VT_ROOT_PATH}/include/" ABSOLUTE)

    list(APPEND VT_INCLUDE_DIRS ${VT_INCLUDE_PATH})
    list(APPEND VT_LIBRARY_DIRS ${VT_LIBRARY_PATH})
    list(APPEND VT_EXECUTABLE "${VT_BIN_PATH}/scorep")

    set(VT_FOUND true)

    message(STATUS "Vampirtrace found (using ${VT_ROOT_PATH})")
else()
    message(STATUS "Could NOT find Vampirtrace (missing: VT_DIR )")
endif()
