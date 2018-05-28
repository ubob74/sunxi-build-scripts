#!/bin/bash -x

. ../sunxirc

source ../common.sh

IMAGE=newrootfs.img.gz

check_root_permission;
if [ $? -ne 0 ]; then
	exit 1;
fi

cd $BBOX_DIR || exit 1

if [ ! -f $IMAGE ]; then
	printf "No image %s\n" $IMAGE;
	exit 1;
fi

BB_TMPDIR=`mktemp -d -p $PWD bbox.XXXXXXX || exit 1`
cd $BB_TMPDIR || exit 1
gunzip -c ../$IMAGE | cpio -i || exit 1
chown -R $MAIN_CRED $BB_TMPDIR

