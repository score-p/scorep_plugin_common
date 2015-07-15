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
