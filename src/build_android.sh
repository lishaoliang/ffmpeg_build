#!/bin/bash

ARCH=$1

source cfg_android.sh $ARCH

LIBS_DIR=$(cd `dirname $0`; pwd)/libs/lib-ffmpeg
echo "LIBS_DIR="$LIBS_DIR

cd ffmpeg-3.4.5

PLATFORM=$ANDROID_NDK_ROOT/platforms/$AOSP_API/$AOSP_ARCH
TOOLCHAIN=$ANDROID_NDK_ROOT/toolchains/$TOOLCHAIN_BASE-$AOSP_TOOLCHAIN_SUFFIX/prebuilt/linux-x86_64

PREFIX=$LIBS_DIR/$AOSP_ABI

echo "cc=$TOOLCHAIN/bin/$TOOLNAME_BASE-gcc"
#exit 0

./configure \
--prefix=$PREFIX \
--enable-cross-compile \
--disable-runtime-cpudetect \
--disable-asm \
--arch=$AOSP_ABI \
--target-os=android \
--cc=$TOOLCHAIN/bin/$TOOLNAME_BASE-gcc \
--cross-prefix=$TOOLCHAIN/bin/$TOOLNAME_BASE- \
--disable-stripping \
--nm=$TOOLCHAIN/bin/$TOOLNAME_BASE-nm \
--sysroot=$PLATFORM \
--enable-gpl \
--disable-shared \
--enable-static \
--enable-small \
--enable-postproc \
--enable-avdevice \
--disable-outdevs \
--disable-ffprobe \
--disable-ffplay \
--disable-ffmpeg \
--disable-ffserver \
--disable-debug \
--disable-ffprobe \
--disable-ffplay \
--disable-ffmpeg \
--disable-symver \
--disable-stripping \
--extra-cflags="$FF_EXTRA_CFLAGS $FF_CFLAGS" \
--extra-ldflags="  "

make clean
make -j4
make install

cd ..

#合并 so库
#bash merge_android.sh $ARCH


