# Remove demos not used by matrix gui

do_install_append() {
	rm -rf ${D}${bindir}/SGX/demos/Raw/OGLES2FilmTV
	rm -rf ${D}${bindir}/SGX/demos/Raw/OGLES2MagicLantern	
	rm -rf ${D}${bindir}/SGX/demos/Wayland
}
