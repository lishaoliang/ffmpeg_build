## android平台

### 编译环境
* Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-62-generic x86_64)
* [android-ndk-r16b-linux-x86_64](https://dl.google.com/android/repository/android-ndk-r16b-linux-x86_64.zip)
* ffmpeg-3.4.5

### ndk版本选择
* [ndk历史版本下载地址](https://github.com/lishaoliang/ffmpeg/blob/master/docs/android_sdk.md)

### Ubuntu 16.04环境
* ndk高阶版本只支持64位操作系统

解压ndk
```
cd /opt/
sudo unzip ../android-ndk-r16b-linux-x86_64.zip
```

添加如下代码
```
sudo vi ~/.bashrc

# add android ndk - 2019.1.26
export NDKROOT=/opt/android-ndk-r16b
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
/opt/android-ndk-r16b/build/core/build-local.mk:151: *** Android NDK: Aborting    .  Stop.
```
