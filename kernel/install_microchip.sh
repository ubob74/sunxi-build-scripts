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

cd $SUNXI_KERNEL || exit 1

MICROCHIP_DRV_DIR=drivers/net/ethernet/microchip/
MICROCHIP_DRV=enc28j60.ko

modinfo $MICROCHIP_DRV_DIR/$MICROCHIP_DRV || exit 1
cp -i $MICROCHIP_DRV_DIR/$MICROCHIP_DRV $MPOINT/home/bob
