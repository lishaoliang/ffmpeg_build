#!/bin/bash


#tar -vxf ffmpeg-3.4.5.tar.xz
#mkdir ./libs

# https://developer.android.google.cn/ndk/guides/abis
# 全部平台: armeabi armeabi-v7a arm64-v8a x86 x86_64 mips mips64
# arm64-v8a 有错误打印
# mips mips64 编译错误
for arch in armeabi armeabi-v7a arm64-v8a x86 x86_64
do
    bash mk_android.sh $arch
done
