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
include examples/mongocxx/CMakeFiles/get_values_from_documents.dir/depend.make

# Include the progress variables for this target.
include examples/mongocxx/CMakeFiles/get_values_from_documents.dir/progress.make

# Include the compile flags for this target's objects.
include examples/mongocxx/CMakeFiles/get_values_from_documents.dir/flags.make

examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o: examples/mongocxx/CMakeFiles/get_values_from_documents.dir/flags.make
examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o: /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/get_values_from_documents.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o -c /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/get_values_from_documents.cpp

examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.i"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/get_values_from_documents.cpp > CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.i

examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.s"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/get_values_from_documents.cpp -o CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.s

examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o.requires:

.PHONY : examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o.requires

examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o.provides: examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o.requires
	$(MAKE) -f examples/mongocxx/CMakeFiles/get_values_from_documents.dir/build.make examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o.provides.build
.PHONY : examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o.provides

examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o.provides.build: examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o


# Object files for target get_values_from_documents
get_values_from_documents_OBJECTS = \
"CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o"

# External object files for target get_values_from_documents
get_values_from_documents_EXTERNAL_OBJECTS =

examples/mongocxx/get_values_from_documents: examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o
examples/mongocxx/get_values_from_documents: examples/mongocxx/CMakeFiles/get_values_from_documents.dir/build.make
examples/mongocxx/get_values_from_documents: src/mongocxx/libmongocxx.so.3.3.1
examples/mongocxx/get_values_from_documents: src/bsoncxx/libbsoncxx.so.3.3.1
examples/mongocxx/get_values_from_documents: examples/mongocxx/CMakeFiles/get_values_from_documents.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable get_values_from_documents"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/get_values_from_documents.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/mongocxx/CMakeFiles/get_values_from_documents.dir/build: examples/mongocxx/get_values_from_documents

.PHONY : examples/mongocxx/CMakeFiles/get_values_from_documents.dir/build

examples/mongocxx/CMakeFiles/get_values_from_documents.dir/requires: examples/mongocxx/CMakeFiles/get_values_from_documents.dir/get_values_from_documents.cpp.o.requires

.PHONY : examples/mongocxx/CMakeFiles/get_values_from_documents.dir/requires

examples/mongocxx/CMakeFiles/get_values_from_documents.dir/clean:
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && $(CMAKE_COMMAND) -P CMakeFiles/get_values_from_documents.dir/cmake_clean.cmake
.PHONY : examples/mongocxx/CMakeFiles/get_values_from_documents.dir/clean

examples/mongocxx/CMakeFiles/get_values_from_documents.dir/depend:
	cd /root/Project5/files/mongodb/build/libmongocxx-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/Project5/files/mongodb/build/libmongocxx /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx /root/Project5/files/mongodb/build/libmongocxx-build /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx/CMakeFiles/get_values_from_documents.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/mongocxx/CMakeFiles/get_values_from_documents.dir/depend

