#!/bin/bash

OUTPUT_PATH="/home/iamjy1005/work/lab/practice/user-library/src/opsrc-ncurses-6.1/output"
TARGET_TOOLCHAIN="$1"
TARGET_MACHINE=
TARGET_DIR=
TARGET_PKG_CONF_DIR=
PKG_CONF_PATH=

OPT_MANPAGES=
OPT_PROGS=

usage() {
	echo -e "Usage:\n\texample) $./jyp-build.sh arm-none-linux-gnueabi"
}

if [ $# = 1 ]; then
	CROSS_COMPILE=y
	TARGET_MACHINE="${TARGET_TOOLCHAIN##*/}"
	TARGET_DIR=${TARGET_MACHINE}
	PKG_CONF_PATH="/usr/local/lib/pkgconfig/arm"

	OPT_MANPAGES="--without-manpages"
	OPT_PROGS="--without-progs"
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
TARGET_PKG_CONF_DIR=${TARGET_PATH}/lib/pkgconfig

[ ! -e "$TARGET_PATH" ] && mkdir -p ${TARGET_PATH}
[ ! -e "$TARGET_PKG_CONF_DIR" ] && mkdir -p ${TARGET_PKG_CONF_DIR}

echo "./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET_MACHINE}"
./configure --with-pkg-config=/usr/bin/pkg-config --enable-pc-files --with-pkg-config-libdir=${TARGET_PKG_CONF_DIR} ${OPT_MANPAGES} ${OPT_PROGS} --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET_MACHINE}
make
make install

[ $? -eq 0 ] && sudo cp -rp ${TARGET_PKG_CONF_DIR}/* ${PKG_CONF_PATH}
