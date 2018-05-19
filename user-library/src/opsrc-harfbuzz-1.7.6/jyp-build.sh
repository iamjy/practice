#!/bin/bash

OUTPUT_PATH="/home/iamjy1005/work/lab/practice/user-library/src/opsrc-harfbuzz-1.7.6/output"
TARGET_TOOLCHAIN="$1"
TARGET_MACHINE=
TARGET_DIR=
PKG_CONF_PATH=

usage() {
	echo -e "Usage:\n\texample) $./jyp-build.sh arm-none-linux-gnueabi"
}

if [ $# = 1 ]; then
	CROSS_COMPILE=y
	TARGET_MACHINE="${TARGET_TOOLCHAIN##*/}"
	TARGET_DIR=${TARGET_MACHINE}
	PKG_CONF_PATH="/usr/local/lib/pkgconfig/arm"
elif [ $# -ge 1 ]; then
	usage
	exit 1
else
	CROSS_COMPILE=n
	TARGET_MACHINE=
	TARGET_DIR="x86_64"
	PKG_CONF_PATH="/usr/local/lib/pkgconfig"
fi

TARGET_PATH="${OUTPUT_PATH}/${TARGET_DIR}"

if [ ! -e "$TARGET_PATH" ]; then
	mkdir ${TARGET_PATH}
fi

echo "./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET_MACHINE}"
./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET_MACHINE}
make
make install
[ $? -eq 0 ] && sudo cp -rp ${TARGET_PATH}/lib/pkgconfig/* ${PKG_CONF_PATH}
