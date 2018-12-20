#!/bin/bash

. ../sunxirc

cd $SUNXI_KERNEL || exit 1

make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE clean

