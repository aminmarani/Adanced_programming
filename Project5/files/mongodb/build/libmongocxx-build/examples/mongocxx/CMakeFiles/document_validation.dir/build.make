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
include examples/mongocxx/CMakeFiles/document_validation.dir/depend.make

# Include the progress variables for this target.
include examples/mongocxx/CMakeFiles/document_validation.dir/progress.make

# Include the compile flags for this target's objects.
include examples/mongocxx/CMakeFiles/document_validation.dir/flags.make

examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o: examples/mongocxx/CMakeFiles/document_validation.dir/flags.make
examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o: /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/document_validation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/document_validation.dir/document_validation.cpp.o -c /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/document_validation.cpp

examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/document_validation.dir/document_validation.cpp.i"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/document_validation.cpp > CMakeFiles/document_validation.dir/document_validation.cpp.i

examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/document_validation.dir/document_validation.cpp.s"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx/document_validation.cpp -o CMakeFiles/document_validation.dir/document_validation.cpp.s

examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o.requires:

.PHONY : examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o.requires

examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o.provides: examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o.requires
	$(MAKE) -f examples/mongocxx/CMakeFiles/document_validation.dir/build.make examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o.provides.build
.PHONY : examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o.provides

examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o.provides.build: examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o


# Object files for target document_validation
document_validation_OBJECTS = \
"CMakeFiles/document_validation.dir/document_validation.cpp.o"

# External object files for target document_validation
document_validation_EXTERNAL_OBJECTS =

examples/mongocxx/document_validation: examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o
examples/mongocxx/document_validation: examples/mongocxx/CMakeFiles/document_validation.dir/build.make
examples/mongocxx/document_validation: src/mongocxx/libmongocxx.so.3.3.1
examples/mongocxx/document_validation: src/bsoncxx/libbsoncxx.so.3.3.1
examples/mongocxx/document_validation: examples/mongocxx/CMakeFiles/document_validation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable document_validation"
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/document_validation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/mongocxx/CMakeFiles/document_validation.dir/build: examples/mongocxx/document_validation

.PHONY : examples/mongocxx/CMakeFiles/document_validation.dir/build

examples/mongocxx/CMakeFiles/document_validation.dir/requires: examples/mongocxx/CMakeFiles/document_validation.dir/document_validation.cpp.o.requires

.PHONY : examples/mongocxx/CMakeFiles/document_validation.dir/requires

examples/mongocxx/CMakeFiles/document_validation.dir/clean:
	cd /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx && $(CMAKE_COMMAND) -P CMakeFiles/document_validation.dir/cmake_clean.cmake
.PHONY : examples/mongocxx/CMakeFiles/document_validation.dir/clean

examples/mongocxx/CMakeFiles/document_validation.dir/depend:
	cd /root/Project5/files/mongodb/build/libmongocxx-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/Project5/files/mongodb/build/libmongocxx /root/Project5/files/mongodb/build/libmongocxx/examples/mongocxx /root/Project5/files/mongodb/build/libmongocxx-build /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx /root/Project5/files/mongodb/build/libmongocxx-build/examples/mongocxx/CMakeFiles/document_validation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/mongocxx/CMakeFiles/document_validation.dir/depend

