#!/bin/bash

pacman -Sy --needed --noconfirm --cachedir /c/pacman-cache make automake-wrapper perl yasm gcc

cd $APPVEYOR_BUILD_FOLDER/libvpx/

./configure --disable-docs --disable-unit-tests --target=x86_64-win64-gcc \
	--enable-vp8-encoder --enable-vp9-encoder \
	--enable-vp8-decoder --enable-vp9-decoder

make

cd $APPVEYOR_BUILD_FOLDER/
mkdir binary
cp libvpx/vpxenc.exe binary/
cp libvpx/vpxdec.exe binary/
cp /usr/bin/msys-2.0.dll binary/
cp /usr/bin/msys-gcc_s-seh-1.dll binary/
cp /usr/bin/msys-stdc++-6.dll binary/

7z a -tzip -mx9 binary.zip binary
