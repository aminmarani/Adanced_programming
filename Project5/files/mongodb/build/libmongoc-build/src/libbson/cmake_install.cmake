# Install script for directory: /root/Project5/files/mongodb/build/libmongoc/src/libbson

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/root/Project5/files/mongodb/build/libmongoc-install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.so.0.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.so.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/libbson-1.0.so.0.0.0"
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/libbson-1.0.so.0"
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/libbson-1.0.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.so.0.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.so.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libbson-1.0" TYPE FILE FILES
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/src/bson/bson-config.h"
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/src/bson/bson-version.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bcon.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-atomic.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-clock.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-compat.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-context.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-decimal128.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-endian.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-error.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-iter.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-json.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-keys.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-macros.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-md5.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-memory.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-oid.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-reader.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-string.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-types.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-utf8.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-value.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-version-functions.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libbson/src/bson/bson-writer.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/src/libbson-1.0.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libbson-1.0" TYPE FILE FILES "/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/libbson-1.0-config.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libbson-1.0" TYPE FILE FILES "/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/libbson-1.0-config-version.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/build/cmake_install.cmake")
  include("/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/examples/cmake_install.cmake")
  include("/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/src/cmake_install.cmake")
  include("/root/Project5/files/mongodb/build/libmongoc-build/src/libbson/tests/cmake_install.cmake")

endif()

