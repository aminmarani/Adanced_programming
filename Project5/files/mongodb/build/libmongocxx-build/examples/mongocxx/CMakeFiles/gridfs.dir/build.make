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
include examples/mongocxx/CMakeFiles/gridfs.dir/depend.make

# Include the progress variables for this target.
include examples/mongocxx/CMakeFiles/gridfs.dir/progress.make

# Include the compile flags for this target's objects.
include examples/mongocxx/CMakeFiles/gridfs.dir/flags.make

examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o: examples/mongocxx/CMakeFiles/gridfs.dir/flags.make
examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o: /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/gridfs.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gridfs.dir/gridfs.cpp.o -c /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/gridfs.cpp

examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gridfs.dir/gridfs.cpp.i"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/gridfs.cpp > CMakeFiles/gridfs.dir/gridfs.cpp.i

examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gridfs.dir/gridfs.cpp.s"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/gridfs.cpp -o CMakeFiles/gridfs.dir/gridfs.cpp.s

examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o.requires:

.PHONY : examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o.requires

examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o.provides: examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o.requires
	$(MAKE) -f examples/mongocxx/CMakeFiles/gridfs.dir/build.make examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o.provides.build
.PHONY : examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o.provides

examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o.provides.build: examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o


# Object files for target gridfs
gridfs_OBJECTS = \
"CMakeFiles/gridfs.dir/gridfs.cpp.o"

# External object files for target gridfs
gridfs_EXTERNAL_OBJECTS =

examples/mongocxx/gridfs: examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o
examples/mongocxx/gridfs: examples/mongocxx/CMakeFiles/gridfs.dir/build.make
examples/mongocxx/gridfs: src/mongocxx/libmongocxx.so.3.3.1
examples/mongocxx/gridfs: src/bsoncxx/libbsoncxx.so.3.3.1
examples/mongocxx/gridfs: examples/mongocxx/CMakeFiles/gridfs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable gridfs"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gridfs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/mongocxx/CMakeFiles/gridfs.dir/build: examples/mongocxx/gridfs

.PHONY : examples/mongocxx/CMakeFiles/gridfs.dir/build

examples/mongocxx/CMakeFiles/gridfs.dir/requires: examples/mongocxx/CMakeFiles/gridfs.dir/gridfs.cpp.o.requires

.PHONY : examples/mongocxx/CMakeFiles/gridfs.dir/requires

examples/mongocxx/CMakeFiles/gridfs.dir/clean:
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && $(CMAKE_COMMAND) -P CMakeFiles/gridfs.dir/cmake_clean.cmake
.PHONY : examples/mongocxx/CMakeFiles/gridfs.dir/clean

examples/mongocxx/CMakeFiles/gridfs.dir/depend:
	cd /root/Project5/files/mongodb/build/libmongocxx-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/Project5/files/mongodb/build/libmongocxx /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx /root/Project5/files/mongodb/build/libmongocxx-build /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx/CMakeFiles/gridfs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/mongocxx/CMakeFiles/gridfs.dir/depend

