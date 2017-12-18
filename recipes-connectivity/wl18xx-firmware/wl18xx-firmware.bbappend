LIC_FILES_CHKSUM = "file://wl18xx/LICENCE;md5=4977a0fe767ee17765ae63c435a32a9e"

PV = "R8.7_SP3"
PR = "r0"

SRCREV_wl18xx = "f659be25473e4bde8dc790bff703ecacde6e21da"
BRANCH_wl18xx = "master"

SRCREV_wl12xx = "df40d15d6ad617e72ce7ea00b91d9117d92dcccc"
BRANCH_wl12xx = "master"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI = " \
	git://git.ti.com/wilink8-wlan/wl18xx_fw.git;protocol=git;;branch=${BRANCH_wl18xx};name=wl18xx;destsuffix=wl18xx \
        git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git;branch=${BRANCH_wl12xx};name=wl12xx;destsuffix=wl12xx \
	file://wl1271-nvs.bin \
"

S = "${WORKDIR}"

do_install() {
        install -d -p ${D}/lib/firmware/ti-connectivity
        install -m 0755 wl18xx/*.bin ${D}/lib/firmware/ti-connectivity
        install -m 0644 wl18xx/LICENCE ${D}/lib/firmware/ti-connectivity
        install -m 0755 wl12xx/ti-connectivity/wl127x-fw*.bin ${D}/lib/firmware/ti-connectivity
	install -m 0755 ${S}/wl1271-nvs.bin ${D}/lib/firmware/ti-connectivity
}
