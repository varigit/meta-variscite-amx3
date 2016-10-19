SOC_FAMILY = "ti43x"
require conf/machine/include/soc-family.inc

DEFAULTTUNE ?= "cortexa9thf-neon"
require conf/machine/include/tune-cortexa9.inc

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"

# For built-in LCD, add xf86-input-tslib
XSERVER = "xserver-xorg \
           xf86-input-evdev \
           xf86-input-mouse \
           xf86-video-fbdev \
           xf86-input-keyboard"

# Default to external video, change to smallscreen for built-in LCD
MACHINE_GUI_CLASS = "bigscreen"

# Increase this everytime you change something in the kernel
MACHINE_KERNEL_PR = "r3"

# Default providers, may need to override for specific machines
PREFERRED_PROVIDER_virtual/kernel = "linux-ti-variscite"
PREFERRED_PROVIDER_virtual/kernel_varsomam43 = "linux-ti-variscite"
PREFERRED_PROVIDER_virtual/bootloader = "u-boot-var-som-am43"
PREFERRED_PROVIDER_virtual/bootloader_varsomam43 = "u-boot-var-som-am43"
PREFERRED_PROVIDER_u-boot = "u-boot-var-som-am43"
PREFERRED_PROVIDER_u-boot_varsomam43 = "u-boot-var-som-am43"

KERNEL_IMAGETYPE = "zImage"

UBOOT_ARCH = "arm"
UBOOT_MACHINE = "varsomam43_config"

UBOOT_ENTRYPOINT = "0x80008000"
UBOOT_LOADADDRESS = "0x80008000"

# Use the expected value of the ubifs filesystem's volume name in the kernel
# and u-boot.
UBI_VOLNAME = "rootfs"

EXTRA_IMAGEDEPENDS += "u-boot"

# List common SoC features, may need to add touchscreen for specific machines
MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"
