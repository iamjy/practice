#!/bin/bash

if [ "$1" = "clean" ]; then
	rm -rf CMakeCache.txt
	rm -rf CMakeFiles
	exit 0
fi

cmake -DCMAKE_TOOLCHAIN_FILE=cmake-rule/toolchain.arm.cmake -DOSAL_SYSTEM_OSTYPE=posix -DOSAL_SYSTEM_BSPTYPE=pc-linux -DOSAL_INCLUDEDIR=/home/iamjy1005/work/lab/practice/user-library/src/opsrc-osal/src/bsp/pc-linux/config /home/iamjy1005/work/lab/practice/user-library/src/opsrc-osal
