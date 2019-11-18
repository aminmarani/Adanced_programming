# Install script for directory: /root/Project5/files/mongodb/build/libmongoc/src/libmongoc

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/mongoc-stat")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.so.0.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.so.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/libmongoc-1.0.so.0.0.0"
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/libmongoc-1.0.so.0"
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/libmongoc-1.0.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.so.0.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.so.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/root/Project5/files/mongodb/build/libmongoc-build/src/libbson:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libmongoc-1.0" TYPE FILE FILES
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/src/mongoc/mongoc-config.h"
    "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/src/mongoc/mongoc-version.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-apm.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-bulk-operation.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-change-stream.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-client.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-client-pool.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-collection.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-cursor.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-database.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-error.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-flags.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-find-and-modify.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-gridfs.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-gridfs-file.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-gridfs-file-page.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-gridfs-file-list.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-handshake.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-host-list.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-init.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-index.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-iovec.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-log.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-macros.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-matcher.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-opcode.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-read-concern.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-read-prefs.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-server-description.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-client-session.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-socket.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-stream-tls-libressl.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-stream-tls-openssl.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-stream.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-stream-buffered.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-stream-file.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-stream-gridfs.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-stream-socket.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-topology-description.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-uri.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-version-functions.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-write-concern.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-rand.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-stream-tls.h"
    "/root/Project5/files/mongodb/build/libmongoc/src/libmongoc/src/mongoc/mongoc-ssl.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/src/libmongoc-1.0.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/src/libmongoc-ssl-1.0.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libmongoc-1.0" TYPE FILE FILES "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/libmongoc-1.0-config.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libmongoc-1.0" TYPE FILE FILES "/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/libmongoc-1.0-config-version.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/build/cmake_install.cmake")
  include("/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/examples/cmake_install.cmake")
  include("/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/src/cmake_install.cmake")
  include("/root/Project5/files/mongodb/build/libmongoc-build/src/libmongoc/tests/cmake_install.cmake")

endif()

