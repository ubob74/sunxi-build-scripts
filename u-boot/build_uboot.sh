#!/bin/bash

. ../sunxirc

cd $UBOOT_DIR || exit 1

# swig and python-dev are required
# to install do apt-get install swig python-dev

export KBUILD_VERBOSE=1
test -f .config || make CROSS_COMPILE=$CROSS_COMPILE $UBOOT_DEFCONFIG || exit 1
make -j2 CROSS_COMPILE=$CROSS_COMPILE
