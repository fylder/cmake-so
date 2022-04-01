#include <iostream>
#include <jni.h>
#include "android_log.h"

//当动态库被加载时这个函数被系统调用
extern "C"
JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
    LOGI("JNI_OnLoad");
    JNIEnv *env;
    if (vm->GetEnv((void **) &env, JNI_VERSION_1_6) != JNI_OK) {
        return -1;
    }
    return JNI_VERSION_1_6;
}

int main() {
    std::cout << "fylder ahhhhhhh" << std::endl;
    return 0;
}
