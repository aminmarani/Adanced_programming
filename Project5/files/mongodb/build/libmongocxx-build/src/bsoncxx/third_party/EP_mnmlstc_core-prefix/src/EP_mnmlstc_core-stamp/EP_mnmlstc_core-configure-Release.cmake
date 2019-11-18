

set(command "/usr/bin/cmake;-DCMAKE_C_COMPILER=/usr/bin/cc;-DCMAKE_CXX_COMPILER=/usr/bin/c++;-DCMAKE_BUILD_TYPE=Release;-DBUILD_TESTING=Off;-DCMAKE_INSTALL_PREFIX:PATH=/root/Project5/files/mongodb/build/libmongocxx-install/include/bsoncxx/v_noabi/bsoncxx/third_party/mnmlstc;-DINCLUDE_INSTALL_DIR=.;-GUnix Makefiles;/root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/src/EP_mnmlstc_core")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "/root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/src/EP_mnmlstc_core-stamp/EP_mnmlstc_core-configure-out.log"
  ERROR_FILE "/root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/src/EP_mnmlstc_core-stamp/EP_mnmlstc_core-configure-err.log"
  )
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  set(msg "${msg}\nSee also\n  /root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/src/EP_mnmlstc_core-stamp/EP_mnmlstc_core-configure-*.log")
  message(FATAL_ERROR "${msg}")
else()
  set(msg "EP_mnmlstc_core configure command succeeded.  See also /root/Project5/files/mongodb/build/libmongocxx-build/src/bsoncxx/third_party/EP_mnmlstc_core-prefix/src/EP_mnmlstc_core-stamp/EP_mnmlstc_core-configure-*.log")
  message(STATUS "${msg}")
endif()
