#!/bin/bash

. ../sunxirc

cd $SUNXI_KERNEL && make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE menuconfig

