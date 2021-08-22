cmake_minimum_required(VERSION 3.13)

project(libmpsse2)

add_definitions(-D__linux__ -D__linux)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
find_package(libftd2xx REQUIRED)


add_library(${PROJECT_NAME} STATIC)
add_library(${PROJECT_NAME}::framework ALIAS ${PROJECT_NAME})

set(SRC_FOLDER LibMPSSE)

# Includes ---------------------------------------------------------------------
include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

target_include_directories(${PROJECT_NAME}
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${SRC_FOLDER}>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${SRC_FOLDER}/Include>
        )

target_sources(${PROJECT_NAME}
        PRIVATE
        ${SRC_FOLDER}/ftdi_common.c
        ${SRC_FOLDER}/ftdi_i2c.c
        ${SRC_FOLDER}/ftdi_infra.c
        ${SRC_FOLDER}/ftdi_mid.c
        ${SRC_FOLDER}/ftdi_spi.c
        )

message("FTD2XX params ${LIBFTD2XX_INCLUDE_DIR} ${LIBFTD2XX_LIBRARIES}")
include_directories(${PROJECT_NAME} PUBLIC ${LIBFTD2XX_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} PUBLIC ${LIBFTD2XX_LIBRARIES})

set(${PROJECT_NAME}_PUBLIC_HEADERS
        ${SRC_FOLDER}/Include/libMPSSE_i2c.h
        ${SRC_FOLDER}/Include/libMPSSE_spi.h
        )

set_target_properties(${PROJECT_NAME}
        PROPERTIES
        C_STANDARD 11
        C_STANDARD_REQUIRED ON
        C_EXTENSIONS OFF
        PUBLIC_HEADER "${${PROJECT_NAME}_PUBLIC_HEADERS}"
        EXPORT_NAME framework
        )
