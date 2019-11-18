if("r3.3.1" STREQUAL "")
  message(FATAL_ERROR "Tag for git checkout should not be empty.")
endif()

set(run 0)

if("/root/Project5/files/mongodb/build/libmongocxx-prefix/src/libmongocxx-stamp/libmongocxx-gitinfo.txt" IS_NEWER_THAN "/root/Project5/files/mongodb/build/libmongocxx-prefix/src/libmongocxx-stamp/libmongocxx-gitclone-lastrun.txt")
  set(run 1)
endif()

if(NOT run)
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/root/Project5/files/mongodb/build/libmongocxx-prefix/src/libmongocxx-stamp/libmongocxx-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/root/Project5/files/mongodb/build/libmongocxx"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/root/Project5/files/mongodb/build/libmongocxx'")
endif()

set(git_options)

# disable cert checking if explicitly told not to do it
set(tls_verify "")
if(NOT "x" STREQUAL "x" AND NOT tls_verify)
  list(APPEND git_options
    -c http.sslVerify=false)
endif()

set(git_clone_options)

set(git_shallow "1")
if(git_shallow)
  list(APPEND git_clone_options --depth 1 --no-single-branch)
endif()

set(git_progress "1")
if(git_progress)
  list(APPEND git_clone_options --progress)
endif()

set(git_config "")
foreach(config IN LISTS git_config)
  list(APPEND git_clone_options --config ${config})
endforeach()

# try the clone 3 times incase there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git" ${git_options} clone ${git_clone_options} --origin "origin" "https://github.com/mongodb/mongo-cxx-driver.git" "libmongocxx"
    WORKING_DIRECTORY "/root/Project5/files/mongodb/build"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/mongodb/mongo-cxx-driver.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git" ${git_options} checkout r3.3.1 --
  WORKING_DIRECTORY "/root/Project5/files/mongodb/build/libmongocxx"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'r3.3.1'")
endif()

execute_process(
  COMMAND "/usr/bin/git" ${git_options} submodule init 
  WORKING_DIRECTORY "/root/Project5/files/mongodb/build/libmongocxx"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to init submodules in: '/root/Project5/files/mongodb/build/libmongocxx'")
endif()

execute_process(
  COMMAND "/usr/bin/git" ${git_options} submodule update --recursive --init 
  WORKING_DIRECTORY "/root/Project5/files/mongodb/build/libmongocxx"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/root/Project5/files/mongodb/build/libmongocxx'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/root/Project5/files/mongodb/build/libmongocxx-prefix/src/libmongocxx-stamp/libmongocxx-gitinfo.txt"
    "/root/Project5/files/mongodb/build/libmongocxx-prefix/src/libmongocxx-stamp/libmongocxx-gitclone-lastrun.txt"
  WORKING_DIRECTORY "/root/Project5/files/mongodb/build/libmongocxx"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/root/Project5/files/mongodb/build/libmongocxx-prefix/src/libmongocxx-stamp/libmongocxx-gitclone-lastrun.txt'")
endif()

