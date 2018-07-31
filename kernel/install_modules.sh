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

export PATH=$PATH:/home/bob/opt/armv7-eabihf--glibc--stable/bin
make ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE INSTALL_MOD_PATH=$BBOX_DIR/bbox modules_install || exit 1
print_ok "modules are installed successfully\n";
