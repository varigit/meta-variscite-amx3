require u-boot-var-som-amx3.inc

DESCRIPTION = "u-boot bootloader for var-som-am43 devices"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"

PV = "2014"
PR = "+gitr${SRCPV}"

SRC_URI = "git://github.com/varigit/u-boot-VAR-SOM-AMxx;protocol=git;branch=${BRANCH}"

BRANCH = "krogoth"

# Corresponds to tag var-som-am43 u-boot
SRCREV = "a021cb25495208e7812652fd2e4e561f947a04f9"

SPL_BINARY = "MLO"
SPL_UART_BINARY = "u-boot-spl.bin"
