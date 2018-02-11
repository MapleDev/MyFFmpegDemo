#!/bin/sh
cd ffmpeg-3.3.3
make clean
export NDK=/mnt/d/lin/android-ndk-r14b
export PREBUILT=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt  
export PLATFORM=$NDK/platforms/android-19/arch-arm
export TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
export PREFIX=../ffmpeglib  
build_one(){  
./configure --target-os=linux --prefix=$PREFIX --enable-cross-compile \
--enable-runtime-cpudetect \
--disable-asm \
--arch=arm \
--cc=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-gcc \
--cross-prefix=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi- \
--disable-stripping \
--nm=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-nm \
--sysroot=$PLATFORM \
--enable-gpl --enable-shared --disable-static --enable-small \
--disable-ffprobe --disable-ffplay --disable-ffmpeg --disable-ffserver --disable-debug \
--extra-cflags="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a"   

}  

build_one  

make  
make install  
cd ..