#!/bin/bash

. ../sunxirc

cd $SUNXI_KERNEL || exit 1

MICROCHIP_DRV_DIR=drivers/net/ethernet/microchip
MICROCHIP_DRV=enc28j60.ko

make -j2 ARCH=$ARCH CROSS_COMPILE=$CROSS_COMPILE $MICROCHIP_DRV_DIR/$MICROCHIP_DRV

