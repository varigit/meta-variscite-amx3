# look for files in this layer first
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://psplash-bar-img.h"

do_configure_prepend() {
    install -m 0644 ${WORKDIR}/psplash-bar-img.h ${S}/
}
