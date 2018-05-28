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

test -f $UBOOT_DIR/u-boot-sunxi-with-spl.bin || {
	printf "No sunxi spl file\n";
	exit 1
}

printf "ok\n"

dtb=`basename $SUNXI_H2_PLUS_ZERO_DTB`

find . -name boot\.cmd -exec rm -i {} \;

printf "load mmc 0 0x44000000 /boot/zImage\n" >> ./boot.cmd
printf "load mmc 0 0x46000000 /boot/%s\n" $dtb >> ./boot.cmd
printf "load mmc 0 0x48000000 /boot/%s\n" $INITRAMFS >> ./boot.cmd
printf "setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/ram0 rdinit=/sbin/init rootwait panic=10\n" >> ./boot.cmd
printf "bootz 0x44000000 0x48000000 0x46000000\n" >> ./boot.cmd

$UBOOT_DIR/tools/mkimage -C none -A arm -T script -d ./boot.cmd ./boot.scr || exit 1

cp -i ./boot.scr $MPOINT/boot || exit 1

dd if=$UBOOT_DIR/u-boot-sunxi-with-spl.bin of=$SD_DEV bs=1024 seek=8

