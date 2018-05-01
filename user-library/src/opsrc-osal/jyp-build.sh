#!/bin/bash

TARGET_ARCH="$1"
TOOLCHAIN_FILE="cmake-rule/toolchain.arm.cmake"
SYSTEM_OSTYPE=posix
SYSTEM_BSTYPE=pc-linux
INCLUDEDIR="/home/iamjy1005/work/lab/practice/user-library/src/opsrc-osal/src/bsp/${SYSTEM_BSTYPE}/config"

SRC_DIR=${PWD}

if [ "$1" = "clean" ]; then
	rm -rf CMakeCache.txt
	rm -rf CMakeFiles
	exit 0
fi

if [ "${TARGET_ARCH}" = "arm" ]; then
	cmake -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE} -DOSAL_SYSTEM_OSTYPE=${SYSTEM_OSTYPE} -DOSAL_SYSTEM_BSPTYPE=${SYSTEM_BSTYPE} -DOSAL_INCLUDEDIR=${INCLUDEDIR} ${SRC_DIR}

else
	cmake -DOSAL_SYSTEM_OSTYPE=${SYSTEM_OSTYPE} -DOSAL_SYSTEM_BSPTYPE=${SYSTEM_BSTYPE} -DOSAL_INCLUDEDIR=${INCLUDEDIR} ${SRC_DIR}
	
fi
