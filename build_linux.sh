#!/bin/bash

set -ex

TARGET='qFlipper'
BUILDDIR='build'

export OUTPUT=$TARGET-x86_64.AppImage
export QML_SOURCES_PATHS='..'

mkdir -p $BUILDDIR && cd $BUILDDIR
qmake ../$TARGET.pro -spec linux-g++ CONFIG+=qtquickcompiler && make qmake_all && make -j$(nproc)
linuxdeploy -e $TARGET -i ../application/assets/icons/${TARGET}.png --appdir AppImage --plugin=qt --create-desktop-file -o appimage
