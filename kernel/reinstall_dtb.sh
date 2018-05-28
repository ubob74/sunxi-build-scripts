#!/bin/bash

. ../sunxirc

source ../common.sh

check_root_permission;
if [ $? -ne 0 ]; then
	exit 1;
fi

export PATH=$PATH:$HOME/opt/armv7-eabihf--glibc--stable/bin

dtb=`basename $SUNXI_H2_PLUS_ZERO_DTB`

cd $SUNXI_KERNEL || exit 1
make -j2 ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE dtbs || exit 1

if [ ! -f $SUNXI_H2_PLUS_ZERO_DTB ]; then
	printf "Couldn't find %s\n" $dtb
	exit 1
fi

cd $MPOINT/boot || exit 1
find . -name $dtb -exec rm -i {} \;
cp -i $SUNXI_H2_PLUS_ZERO_DTB $MPOINT/boot

