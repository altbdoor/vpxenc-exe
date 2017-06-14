#!/bin/bash

# https://groups.google.com/a/webmproject.org/forum/#!topic/codec-devel/4tdpkYQ8xdA
# https://github.com/jb-alvarado/media-autobuild_suite/blob/4957e2c4cdb946ba001b12add62b9ac8580987d4/media-autobuild_suite.bat

mkdir /c/pacman-cache
pacman -Sy --noconfirm --cache /c/pacman-cache make automake-wrapper perl yasm gcc

cd $APPVEYOR_BUILD_FOLDER/libvpx/

# LDFLAGS="$LDFLAGS -static-libgcc -static-libstdc++"
# --disable-shared --enable-static
./configure --disable-docs --disable-unit-tests --target=x86_64-win64-gcc
make

cd $APPVEYOR_BUILD_FOLDER/
mkdir binary
cp libvpx/vpxenc.exe binary/
cp libvpx/vpxdec.exe binary/
cp /usr/bin/msys-2.0.dll binary/
cp /usr/bin/msys-gcc_s-seh-1.dll binary/
cp /usr/bin/msys-stdc++-6.dll binary/
7z a binary.zip binary
