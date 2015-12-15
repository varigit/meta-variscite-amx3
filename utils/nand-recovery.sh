#!/bin/sh

MEDIA=/opt

OS=TISDK

MLO_IMAGE=MLO
UBOOT_IMAGE=u-boot.img
KERNEL_IMAGE=zImage
ROOTFS_IMAGE=rootfs-var-som-amx3.ubi.img

install_bootloader()
{
        if [ ! -f $MEDIA/$OS/nand/$MLO_IMAGE ]
        then
                echo "\"$MEDIA/$OS/nand/$MLO_IMAGE\"" does not exist! exit.
                exit 1
        fi
        echo "Installing MLO ..."
        flash_erase /dev/mtd0 0 0 > /dev/null
        flash_erase /dev/mtd1 0 0 > /dev/null
        flash_erase /dev/mtd2 0 0 > /dev/null
        flash_erase /dev/mtd3 0 0 > /dev/null
        flash_erase /dev/mtd4 0 0 > /dev/null
        nandwrite -p /dev/mtd0 $MEDIA/$OS/nand/$MLO_IMAGE > /dev/null
        nandwrite -p /dev/mtd1 $MEDIA/$OS/nand/$MLO_IMAGE > /dev/null
        nandwrite -p /dev/mtd2 $MEDIA/$OS/nand/$MLO_IMAGE > /dev/null
        nandwrite -p /dev/mtd3 $MEDIA/$OS/nand/$MLO_IMAGE > /dev/null

        nandwrite -p /dev/mtd4 $MEDIA/$OS/zImage-var-som-amx3.dtb > /dev/null

        if [ ! -f $MEDIA/$OS/nand/$UBOOT_IMAGE ]
        then
                echo "\"$MEDIA/$OS/nand/$UBOOT_IMAGE\"" does not exist! exit.
                exit 1
        fi
        echo "Installing U-Boot ..."
        flash_erase /dev/mtd5 0 0 > /dev/null
        flash_erase /dev/mtd6 0 0 > /dev/null
        flash_erase /dev/mtd7 0 0 > /dev/null
        nandwrite -p /dev/mtd5 $MEDIA/$OS/nand/$UBOOT_IMAGE > /dev/null
}

install_kernel()
{
        if [ ! -f $MEDIA/$OS/$KERNEL_IMAGE ]
        then
                echo "\"$MEDIA/$OS/$KERNEL_IMAGE\"" does not exist! exit.
                exit 1
        fi
        echo "Installing Kernel ..."
        flash_erase /dev/mtd8 0 0 > /dev/null
        nandwrite -p /dev/mtd8 $MEDIA/$OS/$KERNEL_IMAGE > /dev/null
}

install_rootfs()
{
        if [ ! -f $MEDIA/$OS/$ROOTFS_IMAGE ]
        then
                echo "\"$MEDIA/$OS/$ROOTFS_IMAGE\"" does not exist! exit.
                exit 1
        fi
        echo "Installing UBI rootfs ..."
        flash_erase /dev/mtd9 0 0 > /dev/null
        ubiformat /dev/mtd9 -f $MEDIA/$OS/$ROOTFS_IMAGE -s 2048 -O 2048
}

usage()
{
        cat << EOF
                usage: $0 options

                This script install Linux/Android binaries in VAR-SOM-AMX3 NAND.

                OPTIONS:
                -h                   Show this message
                -o <Linux|Android>   OS type (defualt: Linux).
                -c                   Install kernel with capacitive touchscreen (defualt: no).
EOF
}

while getopts .ho:c. OPTION
do
        case $OPTION in
        h)
                usage
                exit 1
                ;;
        o)
                OS=$OPTARG
                ;;
        c)
                KERNEL_IMAGE=uImage.CTW6120
                ;;
        ?)
                usage
                exit
        ;;
        esac
done

#OS=$1

if [[ "$OS" != "Yocto" ]] && [[ "$OS" != "Android" ]] && [[ "$OS" != "TISDK" ]]
then
        usage
        exit 1
fi

echo "*** VAR-SOM-AMX3 NAND RECOVERY ***"
echo "Installing $OS on NAND ..."

install_bootloader
install_kernel
install_rootfs

exit 0
