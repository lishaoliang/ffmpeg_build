#!/bin/bash

ARCH=x86


#编译目标库目录
LIBS_DIR=$(cd `dirname $0`; pwd)/libs

PREFIX=$LIBS_DIR/lib-win32
LOG_TXT=$LIBS_DIR/win32-$ARCH.txt

FF_ARCH=$ARCH
TOOLCHAIN_NAME=i686-w64-mingw32
CC=i686-w64-mingw32-gcc

# 编译android的部分参数
BUILD_WIN32="\
--prefix=$PREFIX \
--enable-cross-compile \
--target-os=mingw32 \
--disable-asm \
--cc=$CC \
--arch=$FF_ARCH \
--cross-prefix=$TOOLCHAIN_NAME- \
--nm=$TOOLCHAIN_NAME-nm "



#加载ffmpeg裁剪参数
source cfg_ffmpeg.sh
FFMPEG_CUT=$FFMPEG_MIN

echo "++++++++++++++++++++++++++++++++++++++++++++"
echo "FFMPEG_CUT: $FFMPEG_CUT"


#进入目录编译
cd ffmpeg-3.4.5

echo "++++++++++++++++++++++++++++++++++++++++++++"
./configure $BUILD_WIN32 $FFMPEG_CUT --extra-cflags=" " --extra-ldflags=" "

make clean
make -j4
make install

