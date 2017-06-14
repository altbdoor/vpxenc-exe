#!/bin/bash

# https://groups.google.com/a/webmproject.org/forum/#!topic/codec-devel/4tdpkYQ8xdA
# https://github.com/jb-alvarado/media-autobuild_suite/blob/4957e2c4cdb946ba001b12add62b9ac8580987d4/media-autobuild_suite.bat

mkdir /c/pacman-cache
pacman -Sy --noconfirm --cache /c/pacman-cache make automake-wrapper perl yasm gcc

cd $APPVEYOR_BUILD_FOLDER/libvpx/

LDFLAGS="$LDFLAGS -static-libgcc -static-libstdc++"
./configure --disable-docs --disable-unit-tests --disable-shared --enable-static --target=x86_64-win64-gcc
make

cd $APPVEYOR_BUILD_FOLDER/
mkdir binary
cp libvpx/vpxenc.exe binary/
cp libvpx/vpxdec.exe binary/
# cp /cygdrive/c/cygwin-root/bin/cygwin1.dll binary/
# cp /cygdrive/c/cygwin-root/bin/cygstdc++-6.dll binary/
# cp /cygdrive/c/cygwin-root/bin/cyggcc_s-seh-1.dll binary/
7z a binary.zip binary
