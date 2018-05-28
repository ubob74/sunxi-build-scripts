#!/bin/bash

. ../sunxirc

source ../common.sh

cd $SUNXI_KERNEL || exit 1

check_root_permission;
if [ $? -ne 0 ]; then
	exit 1;
fi

check_mount_point;
if [ $? -ne 0 ]; then
	exit 1;
fi

make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE INSTALL_MOD_PATH=$BBOX_DIR/bbox modules_install

