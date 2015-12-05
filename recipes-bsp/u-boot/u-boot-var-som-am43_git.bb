require u-boot-var-som-amx3.inc

DESCRIPTION = "u-boot bootloader for var-som-am43 devices"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"

PV = "2014"
PR = "+gitr${SRCPV}"

SRC_URI = "git://github.com/varigit/u-boot-VAR-SOM-AMxx;protocol=git;branch=${BRANCH}"

# Corresponds to tag var-som-am43 u-boot
SRCREV = "372a2e01ab1d2ca3dea7a0d44abd7c640d0dfaed"

SPL_BINARY = "MLO"
SPL_UART_BINARY = "u-boot-spl.bin"
