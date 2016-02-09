#Input Options
option(X86E_STATIC "Link x86_energy library static." ON)
option(X86E_DIR "Path to libx86_energy directory" "")
option(X86E_INC "Path to libx86_energy headers" "")
option(X86E_LIB "Path to libx86_energy library" "")

if(X86E_STATIC)
   set(LIBX86E_NAME libx86_energy_static.a)
else()
   set(LIBX86E_NAME libx86_energy.so)
endif()

find_path(X86_ENERGY_LIB_DIR ${LIBX86E_NAME} HINTS ${X86E_LIB} ${X86E_DIR}/lib ${X86E_DIR}/build  ENV LD_LIBRARY_PATH DOC "Path to libx86_energy")

if( X86_ENERGY_LIB_DIR )
    message(STATUS "FOUND: ${X86E_DIR}")
    message(STATUS "FOUND: ${X86_ENERGY_LIB_DIR}")

    find_path(X86_ENERGY_INC_DIR x86_energy.h HINTS ${X86E_INC} ${X86E_DIR} ${X86_ENERGY_LIB_DIR}/../include ${X86E_DIR}/include ${X86E_DIR}/library DOC "Path to x86_energy.h")

    if( X86_ENERGY_INC_DIR )
        message(STATUS "FOUND: ${X86_ENERGY_INC_DIR}")
        set(X86_ENERGY_FOUND true)
    else()
        message(STATUS "Could NOT find libx86_energy header (missing: X86E_DIR / X86E_INC )")
    endif()
else()
    message(STATUS "Could NOT find ${LIBX86E_NAME} (missing: X86E_DIR / X86E_LIB )")
endif()
