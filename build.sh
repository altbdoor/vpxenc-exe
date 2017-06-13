#!/bin/bash

# https://groups.google.com/a/webmproject.org/forum/#!topic/codec-devel/4tdpkYQ8xdA
# https://github.com/jb-alvarado/media-autobuild_suite/blob/4957e2c4cdb946ba001b12add62b9ac8580987d4/media-autobuild_suite.bat
# LDFLAGS="$LDFLAGS -static-libgcc -static-libstdc++"

cd $APPVEYOR_BUILD_FOLDER/libvpx/
./configure --disable-docs --disable-unit-tests --disable-shared --enable-static --target=x86_64-win64-gcc
make

cd $APPVEYOR_BUILD_FOLDER/
mkdir build
cp libvpx/vpxenc.exe build/
cp libvpx/vpxdec.exe build/
cp /cygdrive/c/cygwin-root/bin/cygwin1.dll build/
cp /cygdrive/c/cygwin-root/bin/cygstdc++-6.dll build/
7z a bin.zip build
