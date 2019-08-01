#!/bin/bash

(ls -l /dev | grep uc) || exit 1
sh -x build_uboot.sh && \
sudo sh -x install_uboot.sh && \
sudo sh -x install_uboot_spl.sh 
sudo umount /mnt/sddev
ls -l /mnt/sddev
