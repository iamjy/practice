# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/iamjy1005/work/lab/practice/script/cmake/add_custom_target

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/iamjy1005/work/lab/practice/script/cmake/add_custom_target

# Utility rule file for print-day.

# Include the progress variables for this target.
include CMakeFiles/print-day.dir/progress.make

CMakeFiles/print-day:
	echo Today\ is\ Monday

print-day: CMakeFiles/print-day
print-day: CMakeFiles/print-day.dir/build.make

.PHONY : print-day

# Rule to build all files generated by this target.
CMakeFiles/print-day.dir/build: print-day

.PHONY : CMakeFiles/print-day.dir/build

CMakeFiles/print-day.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/print-day.dir/cmake_clean.cmake
.PHONY : CMakeFiles/print-day.dir/clean

CMakeFiles/print-day.dir/depend:
	cd /home/iamjy1005/work/lab/practice/script/cmake/add_custom_target && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/iamjy1005/work/lab/practice/script/cmake/add_custom_target /home/iamjy1005/work/lab/practice/script/cmake/add_custom_target /home/iamjy1005/work/lab/practice/script/cmake/add_custom_target /home/iamjy1005/work/lab/practice/script/cmake/add_custom_target /home/iamjy1005/work/lab/practice/script/cmake/add_custom_target/CMakeFiles/print-day.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/print-day.dir/depend

