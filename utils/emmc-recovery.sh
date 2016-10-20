#!/bin/bash

umount /dev/mmcblk1p1 >& /dev/null
umount /dev/mmcblk1p2 >& /dev/null

# Create partition table 
# 2 partitions: FAT32 (70MB) and Linux ext3 (remaining space)
sfdisk /dev/mmcblk1 << EOF
,70Mib,0x0C,*
,,,-
EOF

sync 

# Format boot partition
umount /dev/mmcblk1p1 >& /dev/null
mkfs.vfat -F 32 -n "boot" /dev/mmcblk1p1
sync

# Format rootfs partition
umount /dev/mmcblk1p2 >& /dev/null
dd if=/dev/zero of=/dev/mmcblk1p2 bs=128K count=1
mkfs.ext3 -L "rootfs" /dev/mmcblk1p2
sync
                                                                                        
# Mount boot partition
umount /dev/mmcblk1p1 >& /dev/null
rm -rf /run/media/mmcblk1p1
mkdir /run/media/mmcblk1p1
mount /dev/mmcblk1p1 /run/media/mmcblk1p1

# Mount rootfs partition
umount /dev/mmcblk1p2 >& /dev/null 
rm -rf /run/media/mmcblk1p2
mkdir /run/media/mmcblk1p2
mount /dev/mmcblk1p2 /run/media/mmcblk1p2

sync

echo "Copying boot files to the EMMC device"
cp /opt/TISDK/emmc/MLO /run/media/mmcblk1p1
cp /opt/TISDK/emmc/u-boot.img /run/media/mmcblk1p1

echo "Extracting rootfs to the EMMC device"
tar xf /opt/TISDK/tisdk-rootfs-image-varsomamx3.tar.gz -C /run/media/mmcblk1p2

# prevent touch screen calibration
touch /run/media/mmcblk1p2/etc/udev/rules.d/ws-calibrate.rules

sync

umount /dev/mmcblk1p1
umount /dev/mmcblk1p2
