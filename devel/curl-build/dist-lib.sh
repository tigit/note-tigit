#!/bin/bash

api=19
usr=/home/devel/root-ndk-${api}/sysroot/usr
usrx86=/home/devel/root-ndk-${api}-x86/sysroot/usr
src=/home/devel/workspace/temp/curl
dst=/home/devel/workspace/temp/libcurl-${api}

rm -rf ${dst}
mkdir -p ${dst}
mkdir -p ${dst}/lib/armeabi
mkdir -p ${dst}/lib/armeabi-v7a
mkdir -p ${dst}/lib/x86

mkdir -p ${dst}/include/curl
mkdir -p ${dst}/include/tls

cd ${src}/curl-7.43.0

sh ./build-${api}.sh
cp -prf ${usr}/lib/libcurl.a ${dst}/lib/armeabi/

sh ./build-v7a-${api}.sh
cp -prf ${usr}/lib/libcurl.a ${dst}/lib/armeabi-v7a/

sh ./build-x86-${api}.sh
cp -prf ${usrx86}/lib/libcurl.a ${dst}/lib/x86/

cp -prf ${usr}/include/curl/* ${dst}/include/curl/

tls=${src}/mbedtls-1.3.11

sh ./build-${api}.sh
cp -prf ${tls}/library/libmbedtls.a ${dst}/lib/armeabi/

sh ./build-v7a-${api}.sh
cp -prf ${tls}/library/libmbedtls.a ${dst}/lib/armeabi-v7a/

sh ./build-x86-${api}.sh
cp -prf ${tls}/library/libmbedtls.a ${dst}/lib/x86/


cp -prf ${tls}/include/polarssl/* ${dst}/include/tls/
