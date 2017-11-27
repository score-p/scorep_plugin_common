# Copyright (c) 2016, Technische Universität München, Germany
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

find_path(PSC_DIR psc_frontend HINTS /opt/periscope ${PSC_DIR} ENV PATH PATH_SUFFIXES bin DOC "Path to Periscope root folder")

if( PSC_DIR )

    get_filename_component(PSC_ROOT_PATH "${PSC_DIR}/../" ABSOLUTE)
    get_filename_component(PSC_BIN_PATH "${PSC_ROOT_PATH}/bin/" ABSOLUTE)
    get_filename_component(PSC_LIBRARY_PATH "${PSC_ROOT_PATH}/lib/" ABSOLUTE)
    get_filename_component(PSC_INCLUDE_PATH "${PSC_ROOT_PATH}/include/" ABSOLUTE)

    list(APPEND PSC_INCLUDE_DIRS ${PSC_INCLUDE_PATH})
    list(APPEND PSC_LIBRARY_DIRS ${PSC_LIBRARY_PATH})
    list(APPEND PSC_EXECUTABLE_DIRS ${PSC_BIN_PATH}/psc_frontend)

    set(PSC_FOUND true)

    message(STATUS "Periscope found (using ${PSC_ROOT_PATH})")
else()
    message(STATUS "Could NOT find Periscope (missing: PSC_DIR )")
endif()
