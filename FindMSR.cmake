find_path(MSR_LIB_DIR ${LIBMSR_NAME} HINTS ${MSR_LIB} ${MSR_DIR}/lib ENV LD_LIBRARY_PATH DOC "Path to libmsr")

if( MSR_LIB_DIR )

	find_path(MSR_INC_DIR msr.h HINTS ${MSR_INC} ${MSR_LIB_DIR}../include ${MSR_DIR}/include DOC "Path to msr.h")

	if( MSR_INC_DIR )
    	set(MSR_FOUND true)
	else()
	    message(STATUS "Could NOT find libmsr header (missing: MSR_DIR / MSR_INC )")
	endif()
else()
    message(STATUS "Could NOT find ${LIBMSR_NAME} (missing: MSR_DIR / MSR_LIB )")
endif()
