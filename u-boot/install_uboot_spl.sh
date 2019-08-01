#!/bin/bash

. ../sunxirc

source ../common.sh

check_root_permission;
if [ $? -ne 0 ]; then
	exit 1;
fi

test -f $UBOOT_DIR/u-boot-sunxi-with-spl.bin || {
	printf "No sunxi spl file\n";
	exit 1
}

printf "ok\n"

dd if=$UBOOT_DIR/u-boot-sunxi-with-spl.bin of=/dev/uc bs=1024 seek=8

