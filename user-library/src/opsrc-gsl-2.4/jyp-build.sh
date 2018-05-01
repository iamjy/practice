#!/bin/bash

OUTPUT_PATH="/home/iamjy1005/work/lab/practice/user-library/src/opsrc-gsl-2.4/output"
TARGET_TOOLCHAIN="$1"
TARGET_MACHINE=

usage() {
	echo -e "Usage:\n\texample) $./jyp-build.sh arm-none-linux-gnueabi"
}

if [ $# = 1 ]; then
	CROSS_COMPILE=y
	TARGET_MACHINE="${TARGET_TOOLCHAIN##*/}"
elif [ $# -ge 1 ]; then
	usage
	exit 1
else
	CROSS_COMPILE=n
	TARGET_MACHINE="x86_64"
fi

TARGET_PATH="${OUTPUT_PATH}/${TARGET_MACHINE}"

if [ ! -e "$TARGET_PATH" ]; then
	mkdir ${TARGET_PATH}
fi

./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET}
make
make install
