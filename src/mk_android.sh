#!/bin/bash

ARCH=$1

#通过编译: armeabi armeabi-v7a arm64-v8a x86 x86_64
#编译错误: mips mips64
#ARCH=x86_64


#编译目标库目录
LIBS_DIR=$(cd `dirname $0`; pwd)/libs

#加载安卓编译器环境
source setenv-android.sh $ARCH


echo "AOSP_ABI=$AOSP_ABI"

#生成库路径
PREFIX=$LIBS_DIR/lib-android/$AOSP_ABI
LOG_TXT=$LIBS_DIR/android-$ARCH.txt


#ffmpeg-3.4.5/configure文件,line=4470 匹配aarch64|arm64这两个标记
#对于AOSP_ABI=arm64-v8a时, 无法匹配出arch, 导致配置失败
#所有这里使用变量FF_ARCH, 并在arm64-v8a时,变更为aarch64
FF_ARCH=$AOSP_ABI
case "$AOSP_ABI" in
    arm64*)
        FF_ARCH="arm64"
    ;;
esac


#输出setenv-*.sh中的编译参数
echo "++++++++++++++++++++++++++++++++++++++++++++" > $LOG_TXT
echo "ANDROID_NDK_ROOT: $ANDROID_NDK_ROOT" >> $LOG_TXT
echo "AOSP_TOOLCHAIN_PATH: $AOSP_TOOLCHAIN_PATH" >> $LOG_TXT
echo "AOSP_ABI: $AOSP_ABI" >> $LOG_TXT
echo "AOSP_API: $AOSP_API" >> $LOG_TXT
echo "AOSP_SYSROOT: $AOSP_SYSROOT" >> $LOG_TXT
echo "AOSP_FLAGS: $AOSP_FLAGS" >> $LOG_TXT

echo "CPP: $CPP" >> $LOG_TXT
echo "CC: $CC" >> $LOG_TXT
echo "CXX: $CXX" >> $LOG_TXT
echo "LD: $LD" >> $LOG_TXT
echo "AS: $AS" >> $LOG_TXT
echo "AR: $AR" >> $LOG_TXT
echo "RANLIB: $RANLIB" >> $LOG_TXT
echo "STRIP: $STRIP" >> $LOG_TXT


# 编译android的部分参数
BUILD_ANDROID="\
--prefix=$PREFIX \
--enable-cross-compile \
--target-os=android \
--disable-asm \
--cc=$CC \
--arch=$FF_ARCH \
--cross-prefix=$TOOLNAME_BASE- \
--nm=$TOOLNAME_BASE-nm \
--sysroot=$AOSP_SYSROOT "

#输出编译ffmpeg使用的参数
echo "++++++++++++++++++++++++++++++++++++++++++++" >> $LOG_TXT
echo "BUILD_ANDROID: $BUILD_ANDROID" >> $LOG_TXT
echo "--prefix=$PREFIX" >> $LOG_TXT
echo "--arch=$FF_ARCH" >> $LOG_TXT
echo "--cc=$CC" >> $LOG_TXT
echo "--cross-prefix=$TOOLNAME_BASE-" >> $LOG_TXT
echo "--sysroot=$AOSP_SYSROOT" >> $LOG_TXT


#加载ffmpeg裁剪参数
source cfg_ffmpeg.sh
FFMPEG_CUT=$FFMPEG_MIN

echo "++++++++++++++++++++++++++++++++++++++++++++" >> $LOG_TXT
echo "FFMPEG_CUT: $FFMPEG_CUT" >> $LOG_TXT


#进入目录编译
cd ffmpeg-3.4.5

echo "++++++++++++++++++++++++++++++++++++++++++++" >> $LOG_TXT
./configure $BUILD_ANDROID $FFMPEG_CUT --extra-cflags="$AOSP_FLAGS" --extra-ldflags=" " >> $LOG_TXT

make clean
make -j4
make install
