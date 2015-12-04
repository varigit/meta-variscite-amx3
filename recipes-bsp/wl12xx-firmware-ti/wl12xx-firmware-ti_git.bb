DESCRIPTION = "Firmware files for use with TI wl12xx"
LICENSE = "TI-TSPA"
LIC_FILES_CHKSUM = "file://../LICENCE.ti-connectivity;md5=186e7a43cf6c274283ad81272ca218ea"

inherit allarch

PR = "r4+gitr${SRCPV}"

# This recipe provides the latest firmware files for wl12xx.
# Therefore, use the contents of this recipe instead of the contents
# of linux-firmware-wl12xx.
RCONFLICTS_${PN} = "linux-firmware-wl12xx"
RPROVIDES_${PN}  = "linux-firmware-wl12xx"

SRCREV = "7f9cf6ebdedb4776d3c977003b9a7e33537014b2"
SRC_URI = "git://github.com/TI-OpenLink/firmwares.git;protocol=git"

S = "${WORKDIR}/git/ti-connectivity"

do_compile() {
    :
}

do_install() {
    mkdir -p ${D}/lib/firmware/ti-connectivity
    install -D -m 0755 ${S}/wl12*.bin ${D}/lib/firmware/ti-connectivity
}

FILES_${PN} = "/lib/firmware/ti-connectivity/*"
