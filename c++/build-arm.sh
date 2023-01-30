#!/bin/bash

make $1 CROSS_PREFIX=/opt/toolchain/arm/linux/l4t-gcc-toolchain-64-bit-28-3/install/bin/aarch64-unknown-linux-gnu- CROSS32CC=/opt/toolchain/arm/linux/l4t-gcc-toolchain-64-bit-28-3/install/bin/arm-linux-gnueabihf-gcc
#make $1 CROSS_PREFIX=/opt/toolchain/arm/linux/arm-2009q3-67-v4.4.1-arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-
