#!/bin/sh

if [ -z "$2" ]; then 
	echo usage: $0 [rootfs_directory] [ubifs_image_dir]
	exit
fi

ROOTFS_DIR=$1
UBI_DIR=$2
#echo "UBI_DIR=${UBI_DIR}"

# backup demo files
mkdir -p $ROOTFS_DIR/usr/share/qt5/examples_tmp/webkitwidgets/browser
mv $ROOTFS_DIR/usr/share/qt5/examples/webkitwidgets/browser/browser $ROOTFS_DIR/usr/share/qt5/examples_tmp/webkitwidgets/browser
mkdir -p $ROOTFS_DIR/usr/share/qt5/examples_tmp/widgets/animation/animatedtiles
mv $ROOTFS_DIR/usr/share/qt5/examples/widgets/animation/animatedtiles/animatedtiles $ROOTFS_DIR/usr/share/qt5/examples_tmp/widgets/animation/animatedtiles
mkdir -p $ROOTFS_DIR/usr/share/qt5/examples_tmp/widgets/painting/deform
mv $ROOTFS_DIR/usr/share/qt5/examples/widgets/painting/deform/deform $ROOTFS_DIR/usr/share/qt5/examples_tmp/widgets/painting/deform
mkdir -p $ROOTFS_DIR/usr/share/qt5/examples_tmp/widgets/widgets/calculator
mv $ROOTFS_DIR/usr/share/qt5/examples/widgets/widgets/calculator/calculator $ROOTFS_DIR/usr/share/qt5/examples_tmp/widgets/widgets/calculator
mkdir -p $ROOTFS_DIR/usr/share/ti_tmp/audio
mv $ROOTFS_DIR/usr/share/ti/audio/HistoryOfTI.aac $ROOTFS_DIR/usr/share/ti_tmp/audio
mkdir -p $ROOTFS_DIR/usr/share/ti_tmp/video
mv $ROOTFS_DIR/usr/share/ti/video/TearOfSteel-AV-Short-720x420.mp4 $ROOTFS_DIR/usr/share/ti_tmp/video
mv $ROOTFS_DIR/usr/share/ti/video/TearOfSteel-Short-720x420.264 $ROOTFS_DIR/usr/share/ti_tmp/video
mv $ROOTFS_DIR/usr/share/ti/video/TearOfSteel-Short-720x420.m4v $ROOTFS_DIR/usr/share/ti_tmp/video

# remove unused folders
rm -rf $ROOTFS_DIR/boot/vmlinux* $ROOTFS_DIR/usr/bin/qt5 $ROOTFS_DIR/usr/share/qt5/examples $ROOTFS_DIR/usr/share/ti

# restore correct names
mv $ROOTFS_DIR/usr/share/qt5/examples_tmp $ROOTFS_DIR/usr/share/qt5/examples
mv $ROOTFS_DIR/usr/share/ti_tmp $ROOTFS_DIR/usr/share/ti

#For 300MB NAND: # sudo mkfs.ubifs -r $ROOTFS_DIR -o system_ubifs.img -m 2048 -e 126976 -c 2460
#For 512MB NAND: # sudo mkfs.ubifs -r $ROOTFS_DIR -o system_ubifs.img -m 2048 -e 126976 -c 4145

mkfs.ubifs -r $ROOTFS_DIR -o system_ubifs.img -m 2048 -e 126976 -c 2460
ubinize -o ${UBI_DIR}/rootfs-var-som-am33.ubi.img -m 2048 -p 128KiB -s 2048 -O 2048 ubinize.cfg
