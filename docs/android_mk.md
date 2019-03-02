## android平台


### 参考
* https://github.com/byhook/ffmpeg4android/tree/master/readme
* https://github.com/weidai11/cryptopp
* [设置安卓环境脚本: setenv-android-gcc.sh](https://github.com/weidai11/cryptopp/blob/master/setenv-android-gcc.sh)


### 编译环境
* Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-62-generic x86_64)
* [android-ndk-r15c-linux-x86_64](https://dl.google.com/android/repository/android-ndk-r15c-linux-x86_64.zip)
* [ffmpeg-3.4.5](http://ffmpeg.org/releases/ffmpeg-3.4.5.tar.xz)


### ndk版本选择
* [ndk历史版本下载地址](https://github.com/lishaoliang/ffmpeg/blob/master/docs/android_sdk.md)


* ndk-r16b编译问题
```
/opt/android-ndk-r16b/toolchains/mips64el-linux-android-4.9/prebuilt/linux-x86_64/lib/gcc/mips64el-linux-android/4.9.x/include/stdint.h:9:26: fatal error: stdint.h: No such file or directory
 # include_next <stdint.h>
                          ^
compilation terminated.
ffbuild/common.mak:60: recipe for target 'libavdevice/reverse.o' failed
make: *** [libavdevice/reverse.o] Error 1
make: *** Waiting for unfinished jobs....
```

### Ubuntu 16.04环境
* ndk高阶版本只支持64位操作系统

解压ndk
```
cd /opt/
sudo unzip /../../android-ndk-r15c-linux-x86_64.zip
```

添加如下代码
```
sudo vi ~/.bashrc

# add android ndk - 2019.1.26
export NDKROOT=/opt/android-ndk-r15c
export PATH=$NDKROOT:$PATH
```

使ndk环境生效
```
source ~/.bashrc
```

测试ndk是否安装完成
```
ndk-build

Android NDK: Could not find application project directory !
Android NDK: Please define the NDK_PROJECT_PATH variable to point to it.
/opt/android-ndk-r15c/build/core/build-local.mk:151: *** Android NDK: Aborting    .  Stop.
```
