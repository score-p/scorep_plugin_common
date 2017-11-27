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

find_path(PTF_BIN_DIR psc_frontend HINTS /opt/ptf/bin ${PTF_BIN} ${PTF_BASE}/bin ${PTR_ROOT}/bin ENV PATH PATH_SUFFIXES bin DOC "Path to Periscope root folder")

find_path(SCOREP_BIN_DIR scorep-config HINTS /opt/scorep/bin ${SCOREP_BIN} ${SCOREP_BASE}/bin ${SCOREP_ROOT}/bin ENV PATH PATH_SUFFIXES bin DOC "Path to ScoreP root folder")

if( PTF_BIN_DIR OR SCOREP_BIN_DIR )
    if( PTF_BIN_DIR )
        get_filename_component(TUNING_SUBSTRATE_ROOT_PATH "${PTF_BIN_DIR}/../" ABSOLUTE)
    else( SCOREP_BIN_DIR )
        get_filename_component(TUNING_SUBSTRATE_ROOT_PATH "${SCOREP_BIN_DIR}/../" ABSOLUTE)
    endif()

    find_path(TUNING_SUBSTRATE_INCLUDE_DIRS scorep/SCOREP_TuningPlugins.h scorep/SCOREP_TuningTypes.h HINTS ${PTF_INC} ${PTF_INCDIR} ${PTF_BIN_DIR}/../include ${PTF_BASE}/include ${PTF_ROOT}/include ${SCOREP_INC} ${SCOREP_INCDIR} ${SCOREP_BIN_DIR}/../include ${SCOREP_BASE}/include ${SCOREP_ROOT}/include DOC "Path to SCOREP_TuningPlugins.h")
    find_path(TUNING_SUBSTRATE_LIBRARY_DIRS libtuning_substrate_plugin.so HINTS ${PTF_LIB} ${PTF_LIBDIR} ${PTF_BIN_DIR}/../lib ${PTF_BASE}/lib ${PTF_ROOT}/lib ${SCOREP_LIB} ${SCOREP_LIBDIR} ${SCOREP_BIN_DIR}/../lib ${SCOREP_BASE}/lib ${SCOREP_ROOT}/lib DOC "Path to libtuning_substrate_plugin.so")
    if( TUNING_SUBSTRATE_INCLUDE_DIRS )
        set(TUNING_SUBSTRATE_FOUND true)
    else()
        message(STATUS "Could NOT find SCOREP Tuning Substrate header (missing: PTF_DIR / PTF_ROOT / PTF_INC / PTF_INC_DIR )")
    endif()
else()
    message(STATUS "Could NOT find SCOREP Tuning Substrate header (missing: PTF_DIR / PTF_ROOT / PTF_INC / PTF_INC_DIR )")
endif()
