#!/bin/bash
TOOLCHAIN='/home/devel/root-ndk-21'
export PATH=$PATH:${TOOLCHAIN}/bin

make clean

./configure \
--prefix=${TOOLCHAIN}/sysroot/usr \
--host=arm-linux-androideabi \
--with-sysroot=${TOOLCHAIN}/sysroot \
--enable-optimize \
--enable-shared \
--enable-static \
--disable-rtsp \
--disable-ftp \
--disable-file \
--disable-ldap \
--disable-ldaps \
--disable-rtsp \
--disable-dict \
--disable-telnet \
--disable-tftp \
--disable-pop3 \
--disable-smb \
--disable-imap \
--disable-smtp \
--disable-gopher \
--disable-unix-sockets \
--enable-threaded-resolver \
--enable-http \
--without-libssh2 \
--without-librtmp \
--without-libidn \
--without-gnutls \
--with-polarssl

#export CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16"
#export LDFLAGS="-march=armv7-a -Wl,--fix-cortex-a8"
export CHOST="arm-linux-androideabi"
export CC="clang --sysroot=${TOOLCHAIN}/sysroot"
export CXX="clang++ --sysroot=${TOOLCHAIN}/sysroot"

make -j 4
make install
