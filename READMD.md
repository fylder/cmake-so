## cmake交叉编译

CMakeLists.txt需要修改

```config
set(NDK_DIR /home/Android/sdk/ndk/24.0.8215888)
```

需要编译的源码放到src目录下

### windows

#### 环境搭建

1. cmake 3.21以上
2. ndk 23以上
3. MinGW

编译批处理

```cmd
build
```

#### 备注 windows下需要额外配置MinGW

下载 [llvm-mingw](https://github.com/mstorsjo/llvm-mingw/releases/)

> llvm-mingw-20220323-ucrt-x86_64.zip

在环境变量加入

WINGW_HOME: llvm-mingw目录

PATH: %WINGW_HOME%\bin
