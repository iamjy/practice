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
include CMakeFiles/zlibstatic.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/zlibstatic.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/zlibstatic.dir/flags.make

CMakeFiles/zlibstatic.dir/adler32.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/adler32.o: adler32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/zlibstatic.dir/adler32.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/adler32.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/adler32.c

CMakeFiles/zlibstatic.dir/adler32.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/adler32.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/adler32.c > CMakeFiles/zlibstatic.dir/adler32.i

CMakeFiles/zlibstatic.dir/adler32.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/adler32.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/adler32.c -o CMakeFiles/zlibstatic.dir/adler32.s

CMakeFiles/zlibstatic.dir/adler32.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/adler32.o.requires

CMakeFiles/zlibstatic.dir/adler32.o.provides: CMakeFiles/zlibstatic.dir/adler32.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/adler32.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/adler32.o.provides

CMakeFiles/zlibstatic.dir/adler32.o.provides.build: CMakeFiles/zlibstatic.dir/adler32.o


CMakeFiles/zlibstatic.dir/compress.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/compress.o: compress.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/zlibstatic.dir/compress.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/compress.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/compress.c

CMakeFiles/zlibstatic.dir/compress.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/compress.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/compress.c > CMakeFiles/zlibstatic.dir/compress.i

CMakeFiles/zlibstatic.dir/compress.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/compress.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/compress.c -o CMakeFiles/zlibstatic.dir/compress.s

CMakeFiles/zlibstatic.dir/compress.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/compress.o.requires

CMakeFiles/zlibstatic.dir/compress.o.provides: CMakeFiles/zlibstatic.dir/compress.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/compress.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/compress.o.provides

CMakeFiles/zlibstatic.dir/compress.o.provides.build: CMakeFiles/zlibstatic.dir/compress.o


CMakeFiles/zlibstatic.dir/crc32.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/crc32.o: crc32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/zlibstatic.dir/crc32.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/crc32.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/crc32.c

CMakeFiles/zlibstatic.dir/crc32.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/crc32.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/crc32.c > CMakeFiles/zlibstatic.dir/crc32.i

CMakeFiles/zlibstatic.dir/crc32.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/crc32.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/crc32.c -o CMakeFiles/zlibstatic.dir/crc32.s

CMakeFiles/zlibstatic.dir/crc32.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/crc32.o.requires

CMakeFiles/zlibstatic.dir/crc32.o.provides: CMakeFiles/zlibstatic.dir/crc32.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/crc32.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/crc32.o.provides

CMakeFiles/zlibstatic.dir/crc32.o.provides.build: CMakeFiles/zlibstatic.dir/crc32.o


CMakeFiles/zlibstatic.dir/deflate.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/deflate.o: deflate.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/zlibstatic.dir/deflate.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/deflate.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/deflate.c

CMakeFiles/zlibstatic.dir/deflate.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/deflate.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/deflate.c > CMakeFiles/zlibstatic.dir/deflate.i

CMakeFiles/zlibstatic.dir/deflate.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/deflate.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/deflate.c -o CMakeFiles/zlibstatic.dir/deflate.s

CMakeFiles/zlibstatic.dir/deflate.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/deflate.o.requires

CMakeFiles/zlibstatic.dir/deflate.o.provides: CMakeFiles/zlibstatic.dir/deflate.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/deflate.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/deflate.o.provides

CMakeFiles/zlibstatic.dir/deflate.o.provides.build: CMakeFiles/zlibstatic.dir/deflate.o


CMakeFiles/zlibstatic.dir/gzclose.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/gzclose.o: gzclose.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/zlibstatic.dir/gzclose.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/gzclose.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzclose.c

CMakeFiles/zlibstatic.dir/gzclose.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/gzclose.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzclose.c > CMakeFiles/zlibstatic.dir/gzclose.i

CMakeFiles/zlibstatic.dir/gzclose.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/gzclose.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzclose.c -o CMakeFiles/zlibstatic.dir/gzclose.s

CMakeFiles/zlibstatic.dir/gzclose.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/gzclose.o.requires

CMakeFiles/zlibstatic.dir/gzclose.o.provides: CMakeFiles/zlibstatic.dir/gzclose.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/gzclose.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/gzclose.o.provides

CMakeFiles/zlibstatic.dir/gzclose.o.provides.build: CMakeFiles/zlibstatic.dir/gzclose.o


CMakeFiles/zlibstatic.dir/gzlib.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/gzlib.o: gzlib.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/zlibstatic.dir/gzlib.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/gzlib.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzlib.c

CMakeFiles/zlibstatic.dir/gzlib.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/gzlib.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzlib.c > CMakeFiles/zlibstatic.dir/gzlib.i

CMakeFiles/zlibstatic.dir/gzlib.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/gzlib.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzlib.c -o CMakeFiles/zlibstatic.dir/gzlib.s

CMakeFiles/zlibstatic.dir/gzlib.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/gzlib.o.requires

CMakeFiles/zlibstatic.dir/gzlib.o.provides: CMakeFiles/zlibstatic.dir/gzlib.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/gzlib.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/gzlib.o.provides

CMakeFiles/zlibstatic.dir/gzlib.o.provides.build: CMakeFiles/zlibstatic.dir/gzlib.o


CMakeFiles/zlibstatic.dir/gzread.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/gzread.o: gzread.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/zlibstatic.dir/gzread.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/gzread.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzread.c

CMakeFiles/zlibstatic.dir/gzread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/gzread.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzread.c > CMakeFiles/zlibstatic.dir/gzread.i

CMakeFiles/zlibstatic.dir/gzread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/gzread.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzread.c -o CMakeFiles/zlibstatic.dir/gzread.s

CMakeFiles/zlibstatic.dir/gzread.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/gzread.o.requires

CMakeFiles/zlibstatic.dir/gzread.o.provides: CMakeFiles/zlibstatic.dir/gzread.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/gzread.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/gzread.o.provides

CMakeFiles/zlibstatic.dir/gzread.o.provides.build: CMakeFiles/zlibstatic.dir/gzread.o


CMakeFiles/zlibstatic.dir/gzwrite.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/gzwrite.o: gzwrite.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/zlibstatic.dir/gzwrite.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/gzwrite.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzwrite.c

CMakeFiles/zlibstatic.dir/gzwrite.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/gzwrite.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzwrite.c > CMakeFiles/zlibstatic.dir/gzwrite.i

CMakeFiles/zlibstatic.dir/gzwrite.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/gzwrite.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/gzwrite.c -o CMakeFiles/zlibstatic.dir/gzwrite.s

CMakeFiles/zlibstatic.dir/gzwrite.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/gzwrite.o.requires

CMakeFiles/zlibstatic.dir/gzwrite.o.provides: CMakeFiles/zlibstatic.dir/gzwrite.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/gzwrite.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/gzwrite.o.provides

CMakeFiles/zlibstatic.dir/gzwrite.o.provides.build: CMakeFiles/zlibstatic.dir/gzwrite.o


CMakeFiles/zlibstatic.dir/inflate.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/inflate.o: inflate.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/zlibstatic.dir/inflate.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/inflate.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/inflate.c

CMakeFiles/zlibstatic.dir/inflate.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/inflate.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/inflate.c > CMakeFiles/zlibstatic.dir/inflate.i

CMakeFiles/zlibstatic.dir/inflate.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/inflate.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/inflate.c -o CMakeFiles/zlibstatic.dir/inflate.s

CMakeFiles/zlibstatic.dir/inflate.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/inflate.o.requires

CMakeFiles/zlibstatic.dir/inflate.o.provides: CMakeFiles/zlibstatic.dir/inflate.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/inflate.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/inflate.o.provides

CMakeFiles/zlibstatic.dir/inflate.o.provides.build: CMakeFiles/zlibstatic.dir/inflate.o


CMakeFiles/zlibstatic.dir/infback.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/infback.o: infback.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/zlibstatic.dir/infback.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/infback.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/infback.c

CMakeFiles/zlibstatic.dir/infback.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/infback.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/infback.c > CMakeFiles/zlibstatic.dir/infback.i

CMakeFiles/zlibstatic.dir/infback.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/infback.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/infback.c -o CMakeFiles/zlibstatic.dir/infback.s

CMakeFiles/zlibstatic.dir/infback.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/infback.o.requires

CMakeFiles/zlibstatic.dir/infback.o.provides: CMakeFiles/zlibstatic.dir/infback.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/infback.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/infback.o.provides

CMakeFiles/zlibstatic.dir/infback.o.provides.build: CMakeFiles/zlibstatic.dir/infback.o


CMakeFiles/zlibstatic.dir/inftrees.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/inftrees.o: inftrees.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/zlibstatic.dir/inftrees.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/inftrees.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/inftrees.c

CMakeFiles/zlibstatic.dir/inftrees.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/inftrees.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/inftrees.c > CMakeFiles/zlibstatic.dir/inftrees.i

CMakeFiles/zlibstatic.dir/inftrees.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/inftrees.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/inftrees.c -o CMakeFiles/zlibstatic.dir/inftrees.s

CMakeFiles/zlibstatic.dir/inftrees.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/inftrees.o.requires

CMakeFiles/zlibstatic.dir/inftrees.o.provides: CMakeFiles/zlibstatic.dir/inftrees.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/inftrees.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/inftrees.o.provides

CMakeFiles/zlibstatic.dir/inftrees.o.provides.build: CMakeFiles/zlibstatic.dir/inftrees.o


CMakeFiles/zlibstatic.dir/inffast.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/inffast.o: inffast.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/zlibstatic.dir/inffast.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/inffast.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/inffast.c

CMakeFiles/zlibstatic.dir/inffast.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/inffast.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/inffast.c > CMakeFiles/zlibstatic.dir/inffast.i

CMakeFiles/zlibstatic.dir/inffast.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/inffast.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/inffast.c -o CMakeFiles/zlibstatic.dir/inffast.s

CMakeFiles/zlibstatic.dir/inffast.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/inffast.o.requires

CMakeFiles/zlibstatic.dir/inffast.o.provides: CMakeFiles/zlibstatic.dir/inffast.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/inffast.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/inffast.o.provides

CMakeFiles/zlibstatic.dir/inffast.o.provides.build: CMakeFiles/zlibstatic.dir/inffast.o


CMakeFiles/zlibstatic.dir/trees.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/trees.o: trees.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/zlibstatic.dir/trees.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/trees.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/trees.c

CMakeFiles/zlibstatic.dir/trees.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/trees.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/trees.c > CMakeFiles/zlibstatic.dir/trees.i

CMakeFiles/zlibstatic.dir/trees.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/trees.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/trees.c -o CMakeFiles/zlibstatic.dir/trees.s

CMakeFiles/zlibstatic.dir/trees.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/trees.o.requires

CMakeFiles/zlibstatic.dir/trees.o.provides: CMakeFiles/zlibstatic.dir/trees.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/trees.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/trees.o.provides

CMakeFiles/zlibstatic.dir/trees.o.provides.build: CMakeFiles/zlibstatic.dir/trees.o


CMakeFiles/zlibstatic.dir/uncompr.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/uncompr.o: uncompr.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/zlibstatic.dir/uncompr.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/uncompr.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/uncompr.c

CMakeFiles/zlibstatic.dir/uncompr.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/uncompr.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/uncompr.c > CMakeFiles/zlibstatic.dir/uncompr.i

CMakeFiles/zlibstatic.dir/uncompr.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/uncompr.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/uncompr.c -o CMakeFiles/zlibstatic.dir/uncompr.s

CMakeFiles/zlibstatic.dir/uncompr.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/uncompr.o.requires

CMakeFiles/zlibstatic.dir/uncompr.o.provides: CMakeFiles/zlibstatic.dir/uncompr.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/uncompr.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/uncompr.o.provides

CMakeFiles/zlibstatic.dir/uncompr.o.provides.build: CMakeFiles/zlibstatic.dir/uncompr.o


CMakeFiles/zlibstatic.dir/zutil.o: CMakeFiles/zlibstatic.dir/flags.make
CMakeFiles/zlibstatic.dir/zutil.o: zutil.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/zlibstatic.dir/zutil.o"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/zlibstatic.dir/zutil.o   -c /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/zutil.c

CMakeFiles/zlibstatic.dir/zutil.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/zlibstatic.dir/zutil.i"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/zutil.c > CMakeFiles/zlibstatic.dir/zutil.i

CMakeFiles/zlibstatic.dir/zutil.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/zlibstatic.dir/zutil.s"
	/opt/toolchain/arm/linux/arm-2009q3-67/bin/arm-none-linux-gnueabi-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/zutil.c -o CMakeFiles/zlibstatic.dir/zutil.s

CMakeFiles/zlibstatic.dir/zutil.o.requires:

.PHONY : CMakeFiles/zlibstatic.dir/zutil.o.requires

CMakeFiles/zlibstatic.dir/zutil.o.provides: CMakeFiles/zlibstatic.dir/zutil.o.requires
	$(MAKE) -f CMakeFiles/zlibstatic.dir/build.make CMakeFiles/zlibstatic.dir/zutil.o.provides.build
.PHONY : CMakeFiles/zlibstatic.dir/zutil.o.provides

CMakeFiles/zlibstatic.dir/zutil.o.provides.build: CMakeFiles/zlibstatic.dir/zutil.o


# Object files for target zlibstatic
zlibstatic_OBJECTS = \
"CMakeFiles/zlibstatic.dir/adler32.o" \
"CMakeFiles/zlibstatic.dir/compress.o" \
"CMakeFiles/zlibstatic.dir/crc32.o" \
"CMakeFiles/zlibstatic.dir/deflate.o" \
"CMakeFiles/zlibstatic.dir/gzclose.o" \
"CMakeFiles/zlibstatic.dir/gzlib.o" \
"CMakeFiles/zlibstatic.dir/gzread.o" \
"CMakeFiles/zlibstatic.dir/gzwrite.o" \
"CMakeFiles/zlibstatic.dir/inflate.o" \
"CMakeFiles/zlibstatic.dir/infback.o" \
"CMakeFiles/zlibstatic.dir/inftrees.o" \
"CMakeFiles/zlibstatic.dir/inffast.o" \
"CMakeFiles/zlibstatic.dir/trees.o" \
"CMakeFiles/zlibstatic.dir/uncompr.o" \
"CMakeFiles/zlibstatic.dir/zutil.o"

# External object files for target zlibstatic
zlibstatic_EXTERNAL_OBJECTS =

libz.a: CMakeFiles/zlibstatic.dir/adler32.o
libz.a: CMakeFiles/zlibstatic.dir/compress.o
libz.a: CMakeFiles/zlibstatic.dir/crc32.o
libz.a: CMakeFiles/zlibstatic.dir/deflate.o
libz.a: CMakeFiles/zlibstatic.dir/gzclose.o
libz.a: CMakeFiles/zlibstatic.dir/gzlib.o
libz.a: CMakeFiles/zlibstatic.dir/gzread.o
libz.a: CMakeFiles/zlibstatic.dir/gzwrite.o
libz.a: CMakeFiles/zlibstatic.dir/inflate.o
libz.a: CMakeFiles/zlibstatic.dir/infback.o
libz.a: CMakeFiles/zlibstatic.dir/inftrees.o
libz.a: CMakeFiles/zlibstatic.dir/inffast.o
libz.a: CMakeFiles/zlibstatic.dir/trees.o
libz.a: CMakeFiles/zlibstatic.dir/uncompr.o
libz.a: CMakeFiles/zlibstatic.dir/zutil.o
libz.a: CMakeFiles/zlibstatic.dir/build.make
libz.a: CMakeFiles/zlibstatic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking C static library libz.a"
	$(CMAKE_COMMAND) -P CMakeFiles/zlibstatic.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/zlibstatic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/zlibstatic.dir/build: libz.a

.PHONY : CMakeFiles/zlibstatic.dir/build

CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/adler32.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/compress.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/crc32.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/deflate.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/gzclose.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/gzlib.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/gzread.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/gzwrite.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/inflate.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/infback.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/inftrees.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/inffast.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/trees.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/uncompr.o.requires
CMakeFiles/zlibstatic.dir/requires: CMakeFiles/zlibstatic.dir/zutil.o.requires

.PHONY : CMakeFiles/zlibstatic.dir/requires

CMakeFiles/zlibstatic.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/zlibstatic.dir/cmake_clean.cmake
.PHONY : CMakeFiles/zlibstatic.dir/clean

CMakeFiles/zlibstatic.dir/depend:
	cd /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11 /home/iamjy1005/work/lab/practice/user-library/src/opsrc-zlib-1.2.11/CMakeFiles/zlibstatic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/zlibstatic.dir/depend

