#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

print_err()
{
	printf "${RED}ERROR: $@${NC}";
}

print_ok()
{
	printf "${GREEN}OK: $@${NC}";
}

function check_root_permission()
{
	if [ `id -u` -ne 0 ]; then
		print_err "Root permissions required\n";
		return 1;
	fi
}

function check_mount_point()
{
	unset SD_DEV
	SD_DEV=`mount | grep $MPOINT | awk '{print $1}'`
	if [ -z $SD_DEV ]; then
		print_err "Device is not mounted\n";
		return 1;
	fi
	test -b $SD_DEV;
	if [ $? -ne 0 ]; then
		print_err "Device is not mounted\n";
		return 1;
	fi
	export SD_DEV

	if [ ! -d $MPOINT/boot ]; then
		print_err "Invalid moint point (no boot/ dir)\n";
		return 1;
	fi
}

