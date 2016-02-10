#!/bin/bash

set -v
set -x


df -h | $SKI_TESTBASE/debug-stdin

umount /dev/loop0

# Run the checker
$SKI_TESTBASE/debug "Running the FS checker"
ntfsfix /dev/loop0 |& $SKI_TESTBASE/debug-stdin

losetup -d /dev/loop0
$SKI_TESTBASE/debug "Running uname"
uname -a | $SKI_TESTBASE/debug-stdin

# Checksum of the disk
#/root/usermode/simple-app/debug "Calculating the checksums"
#CHECKSUM="MD5 Checksum: $(md5sum /mnt/tmp/ramdisk.image)"
#/root/usermode/simple-app/debug "${CHECKSUM}" 
