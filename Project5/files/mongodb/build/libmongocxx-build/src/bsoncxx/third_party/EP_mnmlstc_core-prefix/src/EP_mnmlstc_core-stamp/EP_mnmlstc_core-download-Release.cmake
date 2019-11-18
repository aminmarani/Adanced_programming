

set(command "/usr/bin/cmake;-P;/root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/tmp/EP_mnmlstc_core-gitclone.cmake")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "/root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/src/EP_mnmlstc_core-stamp/EP_mnmlstc_core-download-out.log"
  ERROR_FILE "/root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/src/EP_mnmlstc_core-stamp/EP_mnmlstc_core-download-err.log"
  )
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  set(msg "${msg}\nSee also\n  /root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/src/EP_mnmlstc_core-stamp/EP_mnmlstc_core-download-*.log")
  message(FATAL_ERROR "${msg}")
else()
  set(msg "EP_mnmlstc_core download command succeeded.  See also /root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/src/EP_mnmlstc_core-stamp/EP_mnmlstc_core-download-*.log")
  message(STATUS "${msg}")
endif()
