# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/Project5/files/mongodb/build/libmongocxx

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/Project5/files/mongodb/build/libmongocxx-build

# Include any dependencies generated for this target.
include src/mongocxx/test/CMakeFiles/test_crud_specs.dir/depend.make

# Include the progress variables for this target.
include src/mongocxx/test/CMakeFiles/test_crud_specs.dir/progress.make

# Include the compile flags for this target's objects.
include src/mongocxx/test/CMakeFiles/test_crud_specs.dir/flags.make

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/flags.make
src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o: /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx/test_util/client_helpers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o -c /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx/test_util/client_helpers.cpp

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.i"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx/test_util/client_helpers.cpp > CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.i

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.s"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx/test_util/client_helpers.cpp -o CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.s

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o.requires:

.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o.requires

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o.provides: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o.requires
	$(MAKE) -f src/mongocxx/test/CMakeFiles/test_crud_specs.dir/build.make src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o.provides.build
.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o.provides

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o.provides.build: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o


src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/flags.make
src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o: /root/Project5/files/mongodb/build/libmongocxx/src/third_party/catch/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o -c /root/Project5/files/mongodb/build/libmongocxx/src/third_party/catch/main.cpp

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.i"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/Project5/files/mongodb/build/libmongocxx/src/third_party/catch/main.cpp > CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.i

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.s"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/Project5/files/mongodb/build/libmongocxx/src/third_party/catch/main.cpp -o CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.s

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o.requires:

.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o.requires

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o.provides: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o.requires
	$(MAKE) -f src/mongocxx/test/CMakeFiles/test_crud_specs.dir/build.make src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o.provides.build
.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o.provides

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o.provides.build: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o


src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/flags.make
src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o: /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx/test/spec/crud.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o -c /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx/test/spec/crud.cpp

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_crud_specs.dir/spec/crud.cpp.i"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx/test/spec/crud.cpp > CMakeFiles/test_crud_specs.dir/spec/crud.cpp.i

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_crud_specs.dir/spec/crud.cpp.s"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx/test/spec/crud.cpp -o CMakeFiles/test_crud_specs.dir/spec/crud.cpp.s

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o.requires:

.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o.requires

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o.provides: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o.requires
	$(MAKE) -f src/mongocxx/test/CMakeFiles/test_crud_specs.dir/build.make src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o.provides.build
.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o.provides

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o.provides.build: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o


# Object files for target test_crud_specs
test_crud_specs_OBJECTS = \
"CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o" \
"CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o" \
"CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o"

# External object files for target test_crud_specs
test_crud_specs_EXTERNAL_OBJECTS =

src/mongocxx/test/test_crud_specs: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o
src/mongocxx/test/test_crud_specs: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o
src/mongocxx/test/test_crud_specs: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o
src/mongocxx/test/test_crud_specs: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/build.make
src/mongocxx/test/test_crud_specs: src/mongocxx/libmongocxx-mocked.so.3.3.1
src/mongocxx/test/test_crud_specs: /root/Project5/files/mongodb/build/libmongoc-install/lib/libmongoc-1.0.so
src/mongocxx/test/test_crud_specs: /root/Project5/files/mongodb/build/libmongoc-install/lib/libbson-1.0.so
src/mongocxx/test/test_crud_specs: /usr/lib/x86_64-linux-gnu/libssl.so
src/mongocxx/test/test_crud_specs: /usr/lib/x86_64-linux-gnu/libcrypto.so
src/mongocxx/test/test_crud_specs: /usr/lib/x86_64-linux-gnu/libicuuc.so
src/mongocxx/test/test_crud_specs: src/bsoncxx/libbsoncxx.so.3.3.1
src/mongocxx/test/test_crud_specs: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable test_crud_specs"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_crud_specs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/mongocxx/test/CMakeFiles/test_crud_specs.dir/build: src/mongocxx/test/test_crud_specs

.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/build

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/requires: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/test_util/client_helpers.cpp.o.requires
src/mongocxx/test/CMakeFiles/test_crud_specs.dir/requires: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/__/__/third_party/catch/main.cpp.o.requires
src/mongocxx/test/CMakeFiles/test_crud_specs.dir/requires: src/mongocxx/test/CMakeFiles/test_crud_specs.dir/spec/crud.cpp.o.requires

.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/requires

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/clean:
	cd /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test && $(CMAKE_COMMAND) -P CMakeFiles/test_crud_specs.dir/cmake_clean.cmake
.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/clean

src/mongocxx/test/CMakeFiles/test_crud_specs.dir/depend:
	cd /root/Project5/files/mongodb/build/libmongocxx-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/Project5/files/mongodb/build/libmongocxx /root/Project5/files/mongodb/build/libmongocxx/src/mongocxx/test /root/Project5/files/mongodb/build/libmongocxx-build /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test /root/Project5/files/mongodb/build/libmongocxx-build/src/mongocxx/test/CMakeFiles/test_crud_specs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/mongocxx/test/CMakeFiles/test_crud_specs.dir/depend

