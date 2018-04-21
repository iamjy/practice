project (finding)
cmake_minimum_required (VERSION 2.6)

find_program (LS_PATH ls)
message ("The path to the ls program is ${LS_PATH}")

find_file (STDIO_H_PATH stdio.h)
message ("The path to the stdio.h file is ${STDIO_H_PATH}")

find_library (LIB_MATH_PATH m /usr/local/lib /usr/lib64)
message ("The path to the math library is ${LIB_MATH_PATH}")

