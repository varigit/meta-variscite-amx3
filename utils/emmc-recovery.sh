#!/bin/bash

umount /run/media/mmcblk1p1
umount /run/media/mmcblk1p2

sfdisk -D -H 255 -S 63 -C 950 /dev/mmcblk1 << EOF
,9,0x0C,*
10,,,-
EOF

sync 

umount /run/media/mmcblk1p1
umount /run/media/mmcblk1p2

mkfs.vfat -F 32 -n "boot" /dev/mmcblk1p1
mkfs.ext3 -L "rootfs" /dev/mmcblk1p2

sync

rm -rf /run/media/mmcblk1p1
mkdir /run/media/mmcblk1p1
mount /dev/mmcblk1p1 /run/media/mmcblk1p1

rm -rf /run/media/mmcblk1p2
mkdir /run/media/mmcblk1p2
mount /dev/mmcblk1p2 /run/media/mmcblk1p2

sync

echo "Copying boot files to the EMMC device"
cp /opt/TISDK/emmc/MLO /run/media/mmcblk1p1
cp /opt/TISDK/emmc/u-boot.img /run/media/mmcblk1p1

echo "Extracting rootfs to the EMMC device"
tar xvf /opt/TISDK/tisdk-rootfs-image-varsomamx3.tar.gz -C /run/media/mmcblk1p2

# prevent touch screen calibration
touch /run/media/mmcblk1p2/etc/udev/rules.d/ws-calibrate.rules

sync
