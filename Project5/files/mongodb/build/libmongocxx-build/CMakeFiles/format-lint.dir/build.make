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

# Utility rule file for format-lint.

# Include the progress variables for this target.
include CMakeFiles/format-lint.dir/progress.make

CMakeFiles/format-lint:
	python /root/Project5/files/mongodb/build/libmongocxx/etc/clang_format.py lint

format-lint: CMakeFiles/format-lint
format-lint: CMakeFiles/format-lint.dir/build.make

.PHONY : format-lint

# Rule to build all files generated by this target.
CMakeFiles/format-lint.dir/build: format-lint

.PHONY : CMakeFiles/format-lint.dir/build

CMakeFiles/format-lint.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/format-lint.dir/cmake_clean.cmake
.PHONY : CMakeFiles/format-lint.dir/clean

CMakeFiles/format-lint.dir/depend:
	cd /root/Project5/files/mongodb/build/libmongocxx-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/Project5/files/mongodb/build/libmongocxx /root/Project5/files/mongodb/build/libmongocxx /root/Project5/files/mongodb/build/libmongocxx-build /root/Project5/files/mongodb/build/libmongocxx-build /root/Project5/files/mongodb/build/libmongocxx-build/CMakeFiles/format-lint.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/format-lint.dir/depend

