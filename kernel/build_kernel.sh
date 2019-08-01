#!/bin/bash

. ../sunxirc

cd $SUNXI_KERNEL || exit 1

test -f .config || make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $SUNXI_KERNEL_DEFCONFIG || exit 1
make -j4 ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE zImage dtbs || exit 1
make -j4 ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE modules || exit 1

