# Install script for directory: /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/root/Project5/files/mongodb/build/libmongocxx-install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mongocxx/v_noabi" TYPE DIRECTORY FILES "/root/Project5/files/mongodb/build/libmongocxx/src/mongocxx" FILES_MATCHING REGEX "/[^/]*\\.hpp$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mongocxx/v_noabi/mongocxx/config" TYPE FILE FILES "/root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/config/export.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xruntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongocxx.so.3.3.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongocxx.so._noabi"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongocxx.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/root/Project5/files/mongodb/build/libmongoc-install/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/libmongocxx.so.3.3.1"
    "/root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/libmongocxx.so._noabi"
    "/root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/libmongocxx.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongocxx.so.3.3.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongocxx.so._noabi"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongocxx.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx:/root/Project5/files/mongodb/build/libmongoc-install/lib:"
           NEW_RPATH "/root/Project5/files/mongodb/build/libmongoc-install/lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libmongocxx-3.3.1" TYPE FILE FILES
    "/root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/libmongocxx-config.cmake"
    "/root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/libmongocxx-config-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/config/cmake_install.cmake")
  include("/root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test/cmake_install.cmake")

endif()

