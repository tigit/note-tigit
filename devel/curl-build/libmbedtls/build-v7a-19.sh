#!/bin/bash
make clean

export TOOLCHAIN='/home/devel/root-ndk-19'
export PATH=$PATH:${TOOLCHAIN}/bin

export CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16"
export LDFLAGS="-march=armv7-a -Wl,--fix-cortex-a8"
export CHOST="arm-linux-androideabi"
export CC="clang --sysroot=${TOOLCHAIN}/sysroot"
export CXX="clang++ --sysroot=${TOOLCHAIN}/sysroot"

make
