#!/bin/bash

ARCH=$1
SDK=$2

CWD=`pwd`
SOURCE=ffmpeg-3.4.5


# 通过编译: i386 x86_64 armv5 armv6 armv7 armv7s arm64
# 编译错误:
ARCH=arm64


# 平台SDK: iphone simulator watch watchsimulator tv tvsimulator
SDK=iphone


# 加载ios编译器环境
source setenv-ios.sh $ARCH $SDK
echo "IOS_ARCH=$IOS_ARCH"
echo "IOS_FLAGS=$IOS_FLAGS"
echo "APPLE_SDK=$APPLE_SDK"


# 安装目录
LIBS_DIR=$(cd `dirname $0`; pwd)/libs
PREFIX=$LIBS_DIR/lib-ios/$IOS_ARCH
echo "LIBS_DIR=$LIBS_DIR"
echo "PREFIX=$PREFIX"


# CC
CC=clang


# 编译ios的部分参数
BUILD_IOS="\
--prefix=$PREFIX \
--enable-cross-compile \
--target-os=darwin \
--disable-asm \
--cc=$CC \
--arch=$IOS_ARCH \
--sysroot=$IOS_SYSROOT "


# 加载ffmpeg裁剪参数
source cfg_ffmpeg.sh
FFMPEG_CUT=$FFMPEG_MIN


# 进入目录编译
cd ffmpeg-3.4.5

#./configure $BUILD_IOS $FFMPEG_CUT --extra-cflags="$IOS_FLAGS" --extra-ldflags=" "

