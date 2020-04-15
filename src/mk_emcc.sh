#!/bin/bash

ARCH=emcc


#编译目标库目录
LIBS_DIR=$(cd `dirname $0`; pwd)/libs

#安装路径
PREFIX=$LIBS_DIR/lib-emcc
LOG_TXT=$LIBS_DIR/ffmpeg-$ARCH.txt

# 编译android的部分参数
BUILD_ANDROID="\
--prefix=$PREFIX \
--cc="emcc" \
--enable-cross-compile --target-os=none --arch=x86_64 --cpu=generic \
--disable-asm "


#加载ffmpeg裁剪参数
source cfg_ffmpeg.sh
FFMPEG_CUT=$FFMPEG_H26X

echo "BUILD_ANDROID: $BUILD_ANDROID"
echo "FFMPEG_CUT: $FFMPEG_CUT"


#输出编译参数
echo "++++++++++++++++++++++++++++++++++++++++++++" > $LOG_TXT
echo "ARCH: $ARCH" >> $LOG_TXT
echo "BUILD_ANDROID: $BUILD_ANDROID" >> $LOG_TXT
echo "FFMPEG_CUT: $FFMPEG_CUT" >> $LOG_TXT


#进入目录编译
cd ffmpeg-3.4.5

emconfigure ./configure $BUILD_ANDROID $FFMPEG_CUT >> $LOG_TXT

emmake make clean
emmake make -j4
emmake make install

