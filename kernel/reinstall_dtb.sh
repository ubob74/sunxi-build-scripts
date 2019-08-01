#!/bin/bash

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

dtb=`basename $SUNXI_DTB`

cd $SUNXI_KERNEL || exit 1
make -j2 ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE dtbs || exit 1

if [ ! -f $SUNXI_DTB ]; then
	print_err "Couldn't find %s\n" $dtb
	exit 1
fi

cd $MPOINT/boot || exit 1
find . -name $dtb -exec rm -i {} \;
cp -i $SUNXI_DTB $MPOINT/boot
print_ok "DT has been installed successfully\n"
