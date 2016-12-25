NOINST_TOOLS_READLINE_append = " \
    tools/btmgmt \
"

NOINST_TOOLS_EXPERIMENTAL_remove = " \
    tools/btmgmt \
"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
        file://variscite-bt \
        file://variscite-bt.service \
        file://variscite-bt.conf \
"

do_install_append() {
        install -d ${D}${sysconfdir}/bluetooth
        install -m 0644 ${WORKDIR}/variscite-bt.conf ${D}${sysconfdir}/bluetooth

        install -d ${D}${systemd_unitdir}/system
        install -d ${D}${sysconfdir}/systemd/system/multi-user.target.wants
        install -m 0644 ${WORKDIR}/variscite-bt.service ${D}${systemd_unitdir}/system
        install -m 0755 ${WORKDIR}/variscite-bt ${D}${sysconfdir}/bluetooth

        ln -sf ${systemd_unitdir}/system/variscite-bt.service \
               ${D}${sysconfdir}/systemd/system/multi-user.target.wants/variscite-bt.service
}

