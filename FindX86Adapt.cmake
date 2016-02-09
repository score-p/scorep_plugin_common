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
