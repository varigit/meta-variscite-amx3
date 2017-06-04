# Service Pack 4.2

LIC_FILES_CHKSUM = "file://bt/LICENSE;md5=f39eac9f4573be5b012e8313831e72a9"

SRCREV = "c290f8af9e388f37e509ecb111a1b64572b7c225"
BRANCH = "master"
SRC_URI = "git://git.ti.com/ti-bt/service-packs.git;protocol=git;branch=${BRANCH};destsuffix=bt"

S = "${WORKDIR}"

# ensure BT firmware is in ti-connectivity subfolder
do_install() {
        install -d -p ${D}/lib/firmware/ti-connectivity
        install -m 0755 bt/initscripts/*.bts ${D}/lib/firmware/ti-connectivity
}

