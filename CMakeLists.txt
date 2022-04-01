cmake_minimum_required(VERSION 3.21)

set(NDK_DIR /Users/fylder/Library/Android/sdk/ndk/24.0.8215888) # 23.1.7779620    21.0.6113669    24.0.8215888

## 初始配置要在project之前
set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_SYSTEM_VERSION 21)
# set(CMAKE_ANDROID_ARCH_ABI armeabi-v7a)
set(CMAKE_ANDROID_ARCH_ABI arm64-v8a) #ndk版本低,ABI设置可能不生效
#set(CMAKE_ANDROID_ARCH_ABI x86_64)
#set(CMAKE_ANDROID_ARCH_ABI x86)
set(CMAKE_ANDROID_NDK ${NDK_DIR})
set(CMAKE_TOOLCHAIN_FILE ${NDK_DIR}/build/cmake/android.toolchain.cmake)
set(CMAKE_ANDROID_STL_TYPE c++_shared)
set(CMAKE_BUILD_TYPE DEBUG) #指定生成的版本。RELEASE
set(CMAKE_CXX_STANDARD 17) #c++标准
set(CMAKE_CXX_FLAGS_DEBUG "-std=c++17 -frtti -fexceptions") #指定编译选项
set(ANDROID_PLATFORM android-21)


project(ahh)

# 最后设置编译文件要在project之后,否则找不到文件路径/outputs/
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/outputs/jinLibs/${CMAKE_ANDROID_ARCH_ABI})

aux_source_directory(./src SRC_LIST)

add_executable(${PROJECT_NAME}_demo ${SRC_LIST})

find_library(ANDROID_LOG_LIB log)

add_library(${PROJECT_NAME} SHARED ${SRC_LIST})

target_link_libraries(${PROJECT_NAME} ${ANDROID_LOG_LIB})

# 加入头文件
target_include_directories(${PROJECT_NAME} PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
        )