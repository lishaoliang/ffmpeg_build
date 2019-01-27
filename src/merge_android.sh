#!/bin/bash

ARCH=$1

source cfg_android.sh $ARCH

LIBS_DIR=$(cd `dirname $0`; pwd)/libs/lib-ffmpeg
echo "LIBS_DIR="$LIBS_DIR

PLATFORM=$ANDROID_NDK_ROOT/platforms/$AOSP_API/$AOSP_ARCH
TOOLCHAIN=$ANDROID_NDK_ROOT/toolchains/$TOOLCHAIN_BASE-$AOSP_TOOLCHAIN_SUFFIX/prebuilt/linux-x86_64

PREFIX=$LIBS_DIR/$AOSP_ABI
echo "PREFIX="$PREFIX

#ºÏ²¢
$TOOLCHAIN/bin/$TOOLNAME_BASE-ld -rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -L$PREFIX/lib \
	-soname libffmpeg.so -shared -nostdlib -Bsymbolic --whole-archive --no-undefined -o $PREFIX/libffmpeg.so \
    $PREFIX/lib/libavcodec.a \
    $PREFIX/lib/libavdevice.a \
    $PREFIX/lib/libavfilter.a \
    $PREFIX/lib/libavformat.a \
    $PREFIX/lib/libavutil.a \
    $PREFIX/lib/libpostproc.a \
    $PREFIX/lib/libswresample.a \
    $PREFIX/lib/libswscale.a \
    -lc -lm -lz -ldl -llog --dynamic-linker=/system/bin/linker $TOOLCHAIN/lib/gcc/$TOOLNAME_BASE/4.9.x/libgcc.a
	
$TOOLCHAIN/bin/$TOOLNAME_BASE-nm $PREFIX/libffmpeg.so > $PREFIX/libffmpeg.so.nm.txt