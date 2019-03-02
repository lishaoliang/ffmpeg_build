#!/usr/bin/env bash


#只支持H26X解码
export FFMPEG_H26X="\
--disable-runtime-cpudetect \
--disable-debug --disable-logging \
--disable-swscale-alpha \
--disable-all --disable-everything \
--enable-avdevice --enable-avcodec --enable-avformat --enable-swresample --enable-swscale --enable-postproc --enable-avfilter \
--enable-decoder=h264 --enable-decoder=hevc "

#支持H26X解码,写mp4文件,写jpeg文件
export FFMPEG_MIN="\
--disable-runtime-cpudetect \
--disable-debug --disable-logging \
--disable-swscale-alpha \
--disable-all --disable-everything \
--enable-avdevice --enable-avcodec --enable-avformat --enable-swresample --enable-swscale --enable-postproc --enable-avfilter \
--enable-decoder=h264 --enable-decoder=hevc \
--enable-encoder=aac --enable-encoder=mjpeg \
--enable-encoder=ljpeg --enable-encoder=jpeg2000 --enable-encoder=jpegls \
--enable-muxer=mp4 --enable-muxer=mjpeg \
--enable-protocol=file "
