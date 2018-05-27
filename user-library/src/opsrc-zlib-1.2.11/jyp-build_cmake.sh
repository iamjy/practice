#!/bin/bash

export CHOST="$1"

OUTPUT_PATH="${PWD}/output"
TARGET_TOOLCHAIN="$1"
TARGET_MACHINE=
TARGET_DIR=
TARGET_INCLUDE_PATH=
TARGET_LIB_PATH=
TARGET_PKG_CONF_PATH=

usage() {
	echo -e "Usage:\n\texample) $./jyp-build.sh arm-none-linux-gnueabi"
}

if [ $# = 1 ]; then
	CROSS_COMPILE=y
	TARGET_MACHINE="${TARGET_TOOLCHAIN##*/}"
	TARGET_DIR=${TARGET_MACHINE}
	TARGET_INCLUDE_PATH="/usr/local/include/arm"
	TARGET_LIB_PATH="/usr/local/lib/arm"
	TARGET_PKG_CONF_PATH="/usr/local/lib/pkgconfig/arm"
#	TARGET_INC_PATH="/media/iamjy1005/978ada6f-9596-4951-b412-6e8a78f4241d/backup/root/opt/toolchain/arm/linux/linaro/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi/bin/../arm-linux-gnueabi/libc/usr/include"
#	TARGET_PKG_CONF_PATH="/media/iamjy1005/978ada6f-9596-4951-b412-6e8a78f4241d/backup/root/opt/toolchain/arm/linux/linaro/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi/bin/../arm-linux-gnueabi/libc/usr/lib/pkgconfig"
#	TARGET_LIB_PATH="/media/iamjy1005/978ada6f-9596-4951-b412-6e8a78f4241d/backup/root/opt/toolchain/arm/linux/linaro/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabi/bin/../arm-linux-gnueabi/libc/usr/lib/"
elif [ $# -ge 1 ]; then
	usage
	exit 1
else
	CROSS_COMPILE=n
	TARGET_MACHINE=
	TARGET_DIR="x86_64"
	TARGET_INCLUDE_PATH="/usr/local/include"
	TARGET_PKG_CONF_PATH="/usr/local/lib/pkgconfig"
	TARGET_LIB_PATH="/usr/local/lib"
fi

TARGET_PATH="${OUTPUT_PATH}/${TARGET_DIR}"

[ ! -e "$TARGET_PATH" ] && mkdir -p ${TARGET_PATH}

: <<'END'
echo "./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET_MACHINE}"
./configure --prefix=${TARGET_PATH} --host=${TARGET_MACHINE} --target=${TARGET_MACHINE}
make
make install
END

cmake -DCMAKE_INSTALL_PREFIX=${TARGET_PATH} -DCMAKE_TOOLCHAIN_FILE=./cmake-rule/toolchain.arm.cmake .
make && make install

if [ $? -eq 0 ]; then
	[ ! -e "${TARGET_INCLUDE_PATH}" ] && read -p "Do you want create ${TARGET_INCLUDE_PATH} [Y/n]" answer && case $answer in Y|y) sudo mkdir -p ${TARGET_INCLUDE_PATH} ;; *) echo "Do nothing" ;; esac
	[ ! -e "${TARGET_LIB_PATH}" ] && read -p "Do you want create ${TARGET_LIB_PATH} [Y/n]" answer && case $answer in Y|y) sudo mkdir -p ${TARGET_LIB_PATH} ;; *) echo "Do nothing" ;; esac
	[ ! -e "${TARGET_PKG_CONF_PATH}" ] && read -p "Do you want create ${TARGET_PKG_CONF_PATH} [Y/n]" answer && case $answer in Y|y) sudo mkdir -p ${TARGET_PKG_CONF_PATH} ;; *) echo "Do nothing" ;; esac
	[ -d "${TARGET_INCLUDE_PATH}" ] && sudo cp -rp $(find ./output/${TARGET_TOOLCHAIN}/ -name \*.h) ${TARGET_INCLUDE_PATH} && echo "ARM INCLUDE"
	[ -d "${TARGET_LIB_PATH}" ] && sudo cp -rp $(find ./output/${TARGET_TOOLCHAIN}/ -name \*.so.\* -o -name \*.a -o -name \*.la) ${TARGET_LIB_PATH} && echo "ARM LIB"
	[ -d "${TARGET_PKG_CONF_PATH}" ] && sudo cp -rp $(find ./output/${TARGET_TOOLCHAIN}/ -name \*.pc) ${TARGET_PKG_CONF_PATH} && echo "ARM PKG"

        ls -tl ${TARGET_INCLUDE_PATH}
        ls -tl ${TARGET_LIB_PATH}
        ls -tl ${TARGET_PKG_CONF_PATH}
fi
