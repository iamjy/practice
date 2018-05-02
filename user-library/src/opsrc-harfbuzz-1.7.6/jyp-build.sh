#!/bin/bash

OUTPUT_PATH="/home/iamjy1005/work/lab/practice/user-library/src/opsrc-harfbuzz-1.7.6/output"
TARGET_TOOLCHAIN="$1"
TARGET_MACHINE=
TARGET_DIR=

usage() {
	echo -e "Usage:\n\texample) $./jyp-build.sh arm-none-linux-gnueabi"
}

if [ $# = 1 ]; then
	CROSS_COMPILE=y
	TARGET_MACHINE="${TARGET_TOOLCHAIN##*/}"
	TARGET_DIR=${TARGET_MACHINE}
elif [ $# -ge 1 ]; then
	usage
	exit 1
else
	CROSS_COMPILE=n
	TARGET_MACHINE=
	TARGET_DIR="x86_64"
fi

TARGET_PATH="${OUTPUT_PATH}/${TARGET_DIR}"

if [ ! -e "$TARGET_PATH" ]; then
	mkdir -p ${TARGET_PATH}
fi

echo "./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET_MACHIN}"
./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET_MACHIN}
make
make install
