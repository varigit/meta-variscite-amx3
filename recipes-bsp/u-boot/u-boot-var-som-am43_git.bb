require u-boot-var-som-amx3.inc

DESCRIPTION = "u-boot bootloader for var-som-am43 devices"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"

PV = "2015"
PR = "+gitr${SRCPV}"

SRC_URI = "git://github.com/varigit/u-boot-VAR-SOM-AM43;protocol=git;branch=${BRANCH}"

# Corresponds to tag var-som-am33 u-boot
SRCREV = "45c2a523421356b547b2de33e5a18025f5e0f440"

SPL_BINARY = "MLO"
SPL_UART_BINARY = "u-boot-spl.bin"
