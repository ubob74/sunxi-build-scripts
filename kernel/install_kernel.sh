#!/bin/bash -x

. ../sunxirc

source ../common.sh

check_root_permission;
if [ $? -ne 0 ]; then
	exit 1;
fi

check_mount_point;
if [ $? -ne 0 ]; then
	exit 1;
fi

BOOT_DIR=arch/arm/boot
dtb=`basename $SUNXI_H2_PLUS_ZERO_DTB`
cd $SUNXI_KERNEL || exit 1

printf "Device tree file: %s\n" $dtb

if [ ! -f $BOOT_DIR/zImage ]; then
	printf "Couldn't find zImage\n";
	exit 1;
fi

if [ ! -f $BOOT_DIR/dts/$dtb ]; then
	printf "Couldn't find DTB file\n";
	exit 1;
fi

cp -i $BOOT_DIR/zImage $MPOINT/boot || exit 1
cp -i $BOOT_DIR/dts/$dtb $MPOINT/boot

