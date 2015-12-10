# look for files in this layer first
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://fix_default_paths.patch"

do_install_append() {
	dos2unix ${D}${bindir}/wlconf/official_inis/*
}
