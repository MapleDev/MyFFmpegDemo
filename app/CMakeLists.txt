
cmake_minimum_required(VERSION 3.4.1)
include_directories(src/main/cpp/include)
set(LIB_DIR ${CMAKE_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI})

add_library(avcodec SHARED IMPORTED)
set_target_properties(avcodec PROPERTIES IMPORTED_LOCATION
                    ${LIB_DIR}/libavcodec-57.so )

add_library(avfilter SHARED IMPORTED)
set_target_properties(avfilter PROPERTIES IMPORTED_LOCATION
                    ${LIB_DIR}/libavfilter-6.so )

add_library(avformat SHARED IMPORTED)
set_target_properties(avformat PROPERTIES IMPORTED_LOCATION
                    ${LIB_DIR}/libavformat-57.so )

add_library(avutil SHARED IMPORTED)
set_target_properties(avutil PROPERTIES IMPORTED_LOCATION
                    ${LIB_DIR}/libavutil-55.so )

add_library(swresample SHARED IMPORTED)
set_target_properties(swresample PROPERTIES IMPORTED_LOCATION
                    ${LIB_DIR}/libswresample-2.so )

add_library(swscale SHARED IMPORTED)
set_target_properties(swscale PROPERTIES IMPORTED_LOCATION
                    ${LIB_DIR}/libswscale-4.so )

add_library(avdevice SHARED IMPORTED)
set_target_properties(avdevice PROPERTIES IMPORTED_LOCATION
                    ${LIB_DIR}/libavdevice-57.so )

add_library(postproc SHARED IMPORTED)
set_target_properties(postproc PROPERTIES IMPORTED_LOCATION
                    ${LIB_DIR}/libpostproc-54.so )

add_library(ffmpeginfo SHARED
             ${CMAKE_SOURCE_DIR}/src/main/cpp/ffmpeg_demo.c )

target_link_libraries(ffmpeginfo avfilter avcodec avformat avutil swresample swscale postproc avdevice)
