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
	export SD_DEV="/dev/uc1"

	test -b $SD_DEV;
	if [ $? -ne 0 ]; then
		print_err "Device is not present\n";
		return 1;
	fi

	mount $SD_DEV $MPOINT
	if [ [ $? -ne 0] && [ $? -ne 32 ] ]; then
		print_err "Can't mount /dev/uc1";
		return 1;
	fi

	if [ ! -d $MPOINT/boot ]; then
		print_err "Invalid moint point (no boot/ dir)\n";
		return 1;
	fi
}
