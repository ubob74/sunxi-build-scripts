#!/bin/bash

function check_root_permission()
{
	if [ `id -u` -ne 0 ]; then
		printf "Root permission required\n";
		return 1;
	fi
}

function check_mount_point()
{
	unset SD_DEV
	SD_DEV=`mount | grep $MPOINT | awk '{print $1}'`
	if [ -z $SD_DEV ]; then
		printf "Device is not mounted\n";
		return 1;
	fi
	test -b $SD_DEV;
	if [ $? -ne 0 ]; then
		printf "Device is not mounted\n";
		return 1;
	fi
	export SD_DEV

	if [ ! -d $MPOINT/boot ]; then
		printf "Invalid moint point (no boot/ dir)\n";
		return 1;
	fi
}

