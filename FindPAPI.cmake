find_path(PAPI_LIB_DIR libpapi.so HINTS ${PAPI_LIB} ${PAPI_DIR}/lib ENV LD_LIBRARY_PATH DOC "Path to PAPI")

if( PAPI_LIB_DIR )


    find_path(PAPI_INC_DIR papi.h HINTS ${PAPI_INC} ${PAPI_LIB_DIR}/../include ${PAPI_DIR}/include DOC "Path to papi.h")

    if( PAPI_INC_DIR )
        set(PAPI_FOUND true)
    else()
        message(STATUS "Could NOT find PAPI header (missing: PAPI_DIR / PAPI_INC )")
    endif()
else()
    set(PAPI_FOUND false)
    message(STATUS "Could NOT find PAPI (missing: PAPI_DIR / PAPI_LIB )")
endif()
