1. Clone kernel, u-boot and build scripts git repos:
 - https://github.com/linux-sunxi/linux-sunxi.git
 - git://git.denx.de/u-boot.git
 - https://github.com/ubob74/sunxi-build-scripts.git
   Kernel sunxi-next branch is used
2. Edit sunxirc config file in build scripts dir and set required variables.
3. Prepare SD card - format it to vfat, create /boot dir (mkdir /boot) and mount to MPOINT
4. Prepare busybox - copy bbox/newrootfs.img.gz to $BBOX_DIR dir and unpack it: cd bbox; sh -x unpack_bbox.sh
   Then rename $BBOX_DIR/bbox.XXX to $BBOX_DIR/bbox, unpack_bbox.sh adds suffix to the name
5. Build and install kernel: cd kernel; sh -x build_kernel.sh; sudo sh -x install_kernel.sh
6. Install busybox: cd bbox; sudo sh -x install_bbox.sh
7. Build and install u-boot: cd u-boot; sh -x build_uboot.sh; sudo sh -x install_uboot.sh
