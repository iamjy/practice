#!/bin/bash

make $1 CROSS_PREFIX=/opt/toolchain/arm/linux/l4t-gcc-toolchain-64-bit-28-3/install/bin/aarch64-unknown-linux-gnu- CROSS32CC=/opt/toolchain/arm/linux/l4t-gcc-toolchain-64-bit-28-3/install/bin/arm-linux-gnueabihf-gcc
#make $1 CROSS_PREFIX=/opt/toolchain/arm/linux/arm-2012.03/bin/arm-none-linux-gnueabi-
