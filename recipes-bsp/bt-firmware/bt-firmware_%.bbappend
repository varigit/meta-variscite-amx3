# ensure BT firmware is in ti-connectivity subfolder
do_install_append() {
    mv ${D}${base_libdir}/firmware/TIInit_* ${D}${base_libdir}/firmware/ti-connectivity
}

