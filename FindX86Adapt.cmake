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

find_path(X86_ADAPT_LIB_DIR ${LIBX86A_NAME} HINTS ${X86A_LIB} ${X86A_DIR}/lib ENV LD_LIBRARY_PATH DOC "Path to libx86_adapt")

if( X86_ADAPT_LIB_DIR )


    find_path(X86_ADAPT_INC_DIR x86_adapt.h HINTS ${X86A_INC} ${X86_ADAPT_LIB_DIR}/../include ${X86A_DIR}/include DOC "Path to x86_adapt.h")

    if( X86_ADAPT_INC_DIR )
        set(X86_ADAPT_FOUND true)
    else()
        message(STATUS "Could NOT find libx86_adapt header (missing: X86A_DIR / X86A_INC )")
    endif()
else()
    message(STATUS "Could NOT find ${LIBX86A_NAME} (missing: X86A_DIR / X86A_LIB )")
endif()
