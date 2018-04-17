cmake_minimum_required(VERSION 3.11.0)
project(HelloOpengl)

set(CMAKE_VERBOSE_MAKEFILE 1)
set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/lib")
set(SOURCES "${SRC_DIR}/main.c")

# Find and include glfw
find_package(glfw REQUIRED)
include_directories(${GLFW_INCLUDE_DIRS})
link_libraries(${GLFW_LIBRARY_DIRS})

# Find and include opengl
find_package(OpenGL REQUIRED)
include_directories(${OPENGL_INCLUDE_DIRS})

# Add glad
set(GLAD_DIR "${LIB_DIR}/glad")
add_library("glad" "${GLAD_DIR}/src/glad.c")
target_include_directories("glad" PRIVATE "${GLAD_DIR}/include")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLAD_DIR}/include")
target_link_libraries(${PROJECT_NAME} "glad" "${CMAKE_DL_LIBS}")