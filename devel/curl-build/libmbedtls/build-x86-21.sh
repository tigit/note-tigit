#!/bin/bash
make clean

export TOOLCHAIN='/home/devel/root-ndk-21-x86'
export PATH=$PATH:${TOOLCHAIN}/bin

export CFLAGS="-march=i686"
export LDFLAGS="-march=i686"
export CHOST="i686-linux-android"
export CC="clang --sysroot=${TOOLCHAIN}/sysroot"
export CXX="clang++ --sysroot=${TOOLCHAIN}/sysroot"

make
