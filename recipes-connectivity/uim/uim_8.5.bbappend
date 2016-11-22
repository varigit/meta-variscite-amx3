# Look for files in this layer first
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://60-ti-uim.rules \
    file://ti-uim.service \
    file://blacklist-btwilink.conf \
"
#inherit systemd

#SYSTEMD_SERVICE_${PN} = "ti-uim.service"

do_install_append() {
	
	rm -f ${D}/etc/init.d/uim-sysfs
	update-rc.d -f -r ${D} uim-sysfs remove

#	install -d ${D}/${systemd_unitdir}/system/
	install -d ${D}/${sysconfdir}/systemd/system/
#	install -m 0644 ${WORKDIR}/ti-uim.service ${D}/${systemd_unitdir}/system
#	ln -sf /lib/systemd/system/ti-uim.service ${D}/${sysconfdir}/systemd/system/ti-uim.service
 	install -m 0644 ${WORKDIR}/ti-uim.service ${D}/${sysconfdir}/systemd/system/ti-uim.service

	install -d ${D}/${sysconfdir}/udev/rules.d
	install -m 0644 ${WORKDIR}/60-ti-uim.rules ${D}/${sysconfdir}/udev/rules.d

	install -d ${D}${sysconfdir}/modprobe.d
	install -m 0644 ${WORKDIR}/blacklist-btwilink.conf ${D}/${sysconfdir}/modprobe.d/
}


