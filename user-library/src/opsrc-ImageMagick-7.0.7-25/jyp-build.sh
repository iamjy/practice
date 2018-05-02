#!/bin/bash

OUTPUT_PATH="/home/iamjy1005/work/lab/practice/user-library/src/opsrc-ImageMagick-7.0.7-25/output"
TOOLCHAIN_PATH="$1"
TARGET_MACHINE=

usage() {
	echo -e "Usage:\n\texample) $./jyp-build.sh arm-none-linux-gnueabi"
}

if [ $# = 1 ]; then
	CROSS_COMPILE=y
	TARGET_MACHINE="${TOOLCHAIN_PATH##*/}"
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

echo "./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET_MACHINE}"
./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET}
make
make install
