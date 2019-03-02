#!/bin/bash

ARCH=emcc


#编译目标库目录
LIBS_DIR=$(cd `dirname $0`; pwd)/libs

#安装路径
PREFIX=$LIBS_DIR/lib-emcc/$ARCH

# 编译android的部分参数
BUILD_ANDROID="\
--prefix=$PREFIX \
--disable-asm "


#加载ffmpeg裁剪参数
source cfg_ffmpeg.sh
FFMPEG_CUT=$FFMPEG_H26X
echo "FFMPEG_CUT: $FFMPEG_CUT" 


#进入目录编译
cd ffmpeg-3.4.5

emconfigure ./configure $BUILD_ANDROID $FFMPEG_CUT

emmake make clean
emmake make -j4
emmake make install
