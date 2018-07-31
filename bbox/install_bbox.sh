#!/bin/bash -x

. ../sunxirc

source ../common.sh

IMAGE=newrootfs.img.gz

check_root_permission;
if [ $? -ne 0 ]; then
	exit 1;
fi

# check mount point
check_mount_point;
if [ $? -ne 0 ]; then
	exit 1;
fi

cd $BBOX_DIR || exit 1

TMPIMG=`mktemp -p $PWD image.XXXXXX` || exit 1
printf "Temp initramfs path: %s\n" $TMPIMG

cd bbox/ || exit 1
find . | cpio -o -H newc | gzip > $TMPIMG || exit 1
cd .. || exit 1

cd $MPOINT/boot || exit 1
find . -name $IMAGE -exec rm -i {} \;
cp $TMPIMG $IMAGE || exit 1
find . -name $INITRAMFS.bak -exec rm -i {} \;
mv $INITRAMFS $INITRAMFS.bak
mkimage -A arm -T ramdisk -C none -n uInitrd -d $IMAGE $INITRAMFS
ls -l

