# - Try to find libev
# Once done this will define
#  LIBFTD2XX_FOUND        - System has libev
#  LIBFTD2XX_INCLUDE_DIRS - The libev include directories
#  LIBFTD2XX_LIBRARIES    - The libraries needed to use libev

find_path(LIBFTD2XX_INCLUDE_DIR
        NAMES ftd2xx.h)
find_library(LIBFTD2XX_LIBRARY
        NAMES ftd2xx)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LIBFTD2XX_FOUND to TRUE
# if all listed variables are TRUE and the requested version matches.
find_package_handle_standard_args(libftd2xx REQUIRED_VARS
        LIBFTD2XX_LIBRARY LIBFTD2XX_INCLUDE_DIR
        )

if(LIBFTD2XX_FOUND)
    set(LIBFTD2XX_LIBRARIES     ${LIBFTD2XX_LIBRARY})
    set(LIBFTD2XX_INCLUDE_DIRS  ${LIBFTD2XX_INCLUDE_DIR})
endif()

mark_as_advanced(LIBFTD2XX_INCLUDE_DIR LIBFTD2XX_LIBRARY)