require u-boot-var-som-amx3.inc

DESCRIPTION = "u-boot bootloader for var-som-am33 devices"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"

PV = "2014"
PR = "+gitr${SRCPV}"

SRC_URI = "git://github.com/varigit/u-boot-VAR-SOM-AM33-SDK7.git;protocol=git;branch=${BRANCH}"

BRANCH = "krogoth"

# Corresponds to tag var-som-am33 u-boot
SRCREV = "5373e54888828ca2357de15c209a13e1130a9f33"

SPL_BINARY = "MLO"
SPL_UART_BINARY = "u-boot-spl.bin"
