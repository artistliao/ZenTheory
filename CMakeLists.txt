CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT(ZenTheory LANGUAGES CXX)

SET(CMAKE_BUILD_TYPE "Debug")

# We'll need this stuff for sockets stuff
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(SYSTEM "LINUX")
elseif(UNIX)
    set(SYSTEM "UNIX")
elseif(WIN32)
    #message(FATAL_ERROR "Windows systems not supported")
    set(SYSTEM "WINDOWS")
else()
    message(FATAL_ERROR "Unknown operating system")
endif()

# Set compile flags for gcc and clang
if(UNIX)
    set(CMAKE_CXX_FLAGS
        "$ENV{CXXFLAGS} -std=c++14 -Wall")
    set(CMAKE_CXX_FLAGS_RELEASE
        "$ENV{CXXFLAGS} -O3 -fomit-frame-pointer -std=c++14 -Wall")
    set(CMAKE_CXX_FLAGS_DEBUG
        "$ENV{CXXFLAGS} -Og -fno-omit-frame-pointer -g -ggdb -std=c++14 -Wall")
endif()

SET(EXECUTABLE_OUTPUT_PATH ../../bin/)
SET(LIBRARY_OUTPUT_PATH ../../lib/)

INCLUDE_DIRECTORIES(../../include/)
INCLUDE_DIRECTORIES(../../../bsl/include/)
INCLUDE_DIRECTORIES(../../../3rdparty/fastcgipp/include/)
INCLUDE_DIRECTORIES(../../../3rdparty/rapidjson/include/)
INCLUDE_DIRECTORIES(../../../3rdparty/)
LINK_DIRECTORIES(/usr/local/lib ../../bsl/lib)

SET(FILE_LIST
	stdafx.cpp
	main.cpp
	ZenTheory.cpp
    Utils.cpp
    EncodeTransform.cpp
	Typing.cpp)

ADD_EXECUTABLE(ZenTheory ${FILE_LIST})
TARGET_LINK_LIBRARIES(ZenTheory  PRIVATE FileSnippet PRIVATE TextSnippet PRIVATE odbc PRIVATE spdlog)
