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
CMAKE_SOURCE_DIR = /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11

# Include any dependencies generated for this target.
include CMakeFiles/minigzip64.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/minigzip64.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/minigzip64.dir/flags.make

CMakeFiles/minigzip64.dir/test/minigzip.o: CMakeFiles/minigzip64.dir/flags.make
CMakeFiles/minigzip64.dir/test/minigzip.o: test/minigzip.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/minigzip64.dir/test/minigzip.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/minigzip64.dir/test/minigzip.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/test/minigzip.c

CMakeFiles/minigzip64.dir/test/minigzip.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/minigzip64.dir/test/minigzip.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/test/minigzip.c > CMakeFiles/minigzip64.dir/test/minigzip.i

CMakeFiles/minigzip64.dir/test/minigzip.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/minigzip64.dir/test/minigzip.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/test/minigzip.c -o CMakeFiles/minigzip64.dir/test/minigzip.s

CMakeFiles/minigzip64.dir/test/minigzip.o.requires:

.PHONY : CMakeFiles/minigzip64.dir/test/minigzip.o.requires

CMakeFiles/minigzip64.dir/test/minigzip.o.provides: CMakeFiles/minigzip64.dir/test/minigzip.o.requires
	$(MAKE) -f CMakeFiles/minigzip64.dir/build.make CMakeFiles/minigzip64.dir/test/minigzip.o.provides.build
.PHONY : CMakeFiles/minigzip64.dir/test/minigzip.o.provides

CMakeFiles/minigzip64.dir/test/minigzip.o.provides.build: CMakeFiles/minigzip64.dir/test/minigzip.o


# Object files for target minigzip64
minigzip64_OBJECTS = \
"CMakeFiles/minigzip64.dir/test/minigzip.o"

# External object files for target minigzip64
minigzip64_EXTERNAL_OBJECTS =

minigzip64: CMakeFiles/minigzip64.dir/test/minigzip.o
minigzip64: CMakeFiles/minigzip64.dir/build.make
minigzip64: libz.so.1.2.11
minigzip64: CMakeFiles/minigzip64.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable minigzip64"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/minigzip64.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/minigzip64.dir/build: minigzip64

.PHONY : CMakeFiles/minigzip64.dir/build

CMakeFiles/minigzip64.dir/requires: CMakeFiles/minigzip64.dir/test/minigzip.o.requires

.PHONY : CMakeFiles/minigzip64.dir/requires

CMakeFiles/minigzip64.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/minigzip64.dir/cmake_clean.cmake
.PHONY : CMakeFiles/minigzip64.dir/clean

CMakeFiles/minigzip64.dir/depend:
	cd /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles/minigzip64.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/minigzip64.dir/depend

