## ios平台


### 1. 安装Homebrew
* https://brew.sh/
* 安装

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* 使用示例

```
brew install <packageName>    安装包; 示例: brew install wget
brew uninstall <packageName>  卸载包
brew search <packageName>     查找可用包
brew list                     查看已安装包列表
brew info <packageName>       查看任意包信息
brew update                   更新brew
brew -v                       版本
brew -h                       帮助
```


### 2. 安装依赖工具

```
brew install curl
brew install yasm
```

### 3. 下载 build-ffmpeg.sh
* https://github.com/kewlbear/FFmpeg-iOS-build-script
* https://github.com/libav/gas-preprocessor

```
cd xxx/xxx
git clone https://github.com/kewlbear/FFmpeg-iOS-build-script
```

### 4. 编译
* 如果缺失需要的项目, 会自动安装

```
cd FFmpeg-iOS-build-script
./build-ffmpeg.sh
```


### 5. Xcode路径错误

```
xcrun -sdk iphoneos clang is unable to create an executable file.
C compiler test failed.

If you think configure made a mistake, make sure you are using the latest
version from Git.  If the latest version fails, report the problem to the
ffmpeg-user@ffmpeg.org mailing list or IRC #ffmpeg on irc.freenode.net.
Include the log file "ffbuild/config.log" produced by configure as this will help
solve the problem.
```

* 指定使用Xcode位置

```
sudo xcode-select -switch /Applications/Xcode.app/
```

### 6. 编译3.4.5
* 自定义裁剪

```
git clone https://github.com/lishaoliang/ffmpeg
cd ./ffmpeg/src
cp ../tar/ffmpeg-3.4.5.tar.xz .
tar -vxf ffmpeg-3.4.5.tar.xz
./build-ffmpeg.sh
```
