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
CMAKE_SOURCE_DIR = /home/iamjy1005/work/lab/practice/cmake/basic

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/iamjy1005/work/lab/practice/cmake/basic

# Include any dependencies generated for this target.
include CMakeFiles/archiveExtras.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/archiveExtras.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/archiveExtras.dir/flags.make

CMakeFiles/archiveExtras.dir/extras.c.o: CMakeFiles/archiveExtras.dir/flags.make
CMakeFiles/archiveExtras.dir/extras.c.o: extras.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/cmake/basic/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/archiveExtras.dir/extras.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/archiveExtras.dir/extras.c.o   -c /home/iamjy1005/work/lab/practice/cmake/basic/extras.c

CMakeFiles/archiveExtras.dir/extras.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/archiveExtras.dir/extras.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/cmake/basic/extras.c > CMakeFiles/archiveExtras.dir/extras.c.i

CMakeFiles/archiveExtras.dir/extras.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/archiveExtras.dir/extras.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/cmake/basic/extras.c -o CMakeFiles/archiveExtras.dir/extras.c.s

CMakeFiles/archiveExtras.dir/extras.c.o.requires:

.PHONY : CMakeFiles/archiveExtras.dir/extras.c.o.requires

CMakeFiles/archiveExtras.dir/extras.c.o.provides: CMakeFiles/archiveExtras.dir/extras.c.o.requires
	$(MAKE) -f CMakeFiles/archiveExtras.dir/build.make CMakeFiles/archiveExtras.dir/extras.c.o.provides.build
.PHONY : CMakeFiles/archiveExtras.dir/extras.c.o.provides

CMakeFiles/archiveExtras.dir/extras.c.o.provides.build: CMakeFiles/archiveExtras.dir/extras.c.o


# Object files for target archiveExtras
archiveExtras_OBJECTS = \
"CMakeFiles/archiveExtras.dir/extras.c.o"

# External object files for target archiveExtras
archiveExtras_EXTERNAL_OBJECTS = \
"/home/iamjy1005/work/lab/practice/cmake/basic/CMakeFiles/archive.dir/foo.c.o" \
"/home/iamjy1005/work/lab/practice/cmake/basic/CMakeFiles/archive.dir/bar.c.o"

libarchiveExtras.a: CMakeFiles/archiveExtras.dir/extras.c.o
libarchiveExtras.a: CMakeFiles/archive.dir/foo.c.o
libarchiveExtras.a: CMakeFiles/archive.dir/bar.c.o
libarchiveExtras.a: CMakeFiles/archiveExtras.dir/build.make
libarchiveExtras.a: CMakeFiles/archiveExtras.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/iamjy1005/work/lab/practice/cmake/basic/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libarchiveExtras.a"
	$(CMAKE_COMMAND) -P CMakeFiles/archiveExtras.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/archiveExtras.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/archiveExtras.dir/build: libarchiveExtras.a

.PHONY : CMakeFiles/archiveExtras.dir/build

CMakeFiles/archiveExtras.dir/requires: CMakeFiles/archiveExtras.dir/extras.c.o.requires

.PHONY : CMakeFiles/archiveExtras.dir/requires

CMakeFiles/archiveExtras.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/archiveExtras.dir/cmake_clean.cmake
.PHONY : CMakeFiles/archiveExtras.dir/clean

CMakeFiles/archiveExtras.dir/depend:
	cd /home/iamjy1005/work/lab/practice/cmake/basic && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/iamjy1005/work/lab/practice/cmake/basic /home/iamjy1005/work/lab/practice/cmake/basic /home/iamjy1005/work/lab/practice/cmake/basic /home/iamjy1005/work/lab/practice/cmake/basic /home/iamjy1005/work/lab/practice/cmake/basic/CMakeFiles/archiveExtras.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/archiveExtras.dir/depend

