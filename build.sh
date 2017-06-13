#!/bin/bash

# https://groups.google.com/a/webmproject.org/forum/#!topic/codec-devel/4tdpkYQ8xdA
# https://github.com/jb-alvarado/media-autobuild_suite/blob/4957e2c4cdb946ba001b12add62b9ac8580987d4/media-autobuild_suite.bat
LDFLAGS="$LDFLAGS -static-libgcc -static-libstdc++"

cd $APPVEYOR_BUILD_FOLDER/libvpx/
./configure --disable-docs --disable-unit-tests --disable-shared --enable-static --target=x86_64-win64-gcc

make
