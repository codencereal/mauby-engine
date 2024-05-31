cmake_minimum_required(VERSION 3.10)
project(maubyengine)

cmake_policy(SET CMP0072 NEW)
find_package(OpenGL REQUIRED)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 11)
set(OSBits 32)
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(OSBits 64)
endif()

set(FullOutputDir "${CMAKE_SOURCE_DIR}/build/${CMAKE_SYSTEM_NAME}${OSBits}/${CMAKE_BUILD_TYPE}")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${FullOutputDir}/libs)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${FullOutputDir})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${FullOutputDir})

include_directories(
  ${PROJECT_SOURCE_DIR}/deps/include
  ${PROJECT_SOURCE_DIR}/deps/include/glad
  ${PROJECT_SOURCE_DIR}/deps/include/imgui
  ${PROJECT_SOURCE_DIR}/deps/include/imgui/backends
  ${PROJECT_SOURCE_DIR}/src/gui
  ${PROJECT_SOURCE_DIR}/src/
)

file(GLOB_RECURSE ENGINE_SOURCES
    ${PROJECT_SOURCE_DIR}/src/engine/*.c
    ${PROJECT_SOURCE_DIR}/src/platform/*.c
    ${PROJECT_SOURCE_DIR}/src/gui/*.cpp
)

file(GLOB_RECURSE INCLUDE_SOURCES
  ${PROJECT_SOURCE_DIR}/deps/include/glad/*.c
  ${PROJECT_SOURCE_DIR}/deps/include/imgui/*.cpp
  ${PROJECT_SOURCE_DIR}/deps/include/imgui/backends/*.cpp
)

add_library(${PROJECT_NAME} SHARED
  ${PROJECT_SOURCE_DIR}/src/main.c
  ${ENGINE_SOURCES}
  ${INCLUDE_SOURCES}
)

add_executable(demo ${PROJECT_SOURCE_DIR}/src/demos/demo.c)

target_link_libraries(${PROJECT_NAME} 
  glfw
  OpenGL::GL
)

target_link_libraries(demo
  ${PROJECT_NAME}
)