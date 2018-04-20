cmake_minimum_required(VERSION 3.11.0)
project(HelloOpengl)

set(CMAKE_VERBOSE_MAKEFILE 1)
set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(LIB_DIR "${CMAKE_CURRENT_SOURCE_DIR}/lib")
set(SOURCES "${SRC_DIR}/main.c")

# Executable definition and properties
add_executable(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE "${SRC_DIR}")
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 11)

# Find and include glfw

## Don't build GLFW test
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)

find_package(glfw3 3.2 REQUIRED)
target_link_libraries(${PROJECT_NAME} glfw)

# Find and include opengl
if("${CMAKE_SYSTEM_NAME}" STREQUAL "Darwin")
find_package(OpenGL REQUIRED)
set(OPENGLES3_gl_LIBRARY ${OPENGL_LIBRARIES})
else()
find_package(OpenGLES3 REQUIRED)
endif()
target_link_libraries(${PROJECT_NAME} ${OPENGLES3_gl_LIBRARY})

# Add glad
set(GLAD_DIR "${LIB_DIR}/glad")
add_library("glad" "${GLAD_DIR}/src/glad.c")
target_include_directories("glad" PRIVATE "${GLAD_DIR}/include")
target_include_directories(${PROJECT_NAME} PRIVATE "${GLAD_DIR}/include")
target_link_libraries(${PROJECT_NAME} "glad" "${CMAKE_DL_LIBS}")