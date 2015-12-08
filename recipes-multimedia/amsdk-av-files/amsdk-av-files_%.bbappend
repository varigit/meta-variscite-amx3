#just install the wvga sample video referred by matrix gui

VIDEO_FILES_remove_varsomam33  = "video_480p video_wqvga"
VIDEO_FILES_remove_varsomam43  = "video_480p video_wqvga"
VIDEO_FILES_append_varsomam43  = " video_wvga"

do_install_append() {
    rm ${D}${datadir}/ti/video/HistoryOfTI*
    rm ${D}${datadir}/ti/video/*.m2v
}
