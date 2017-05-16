
PV = "R8.7+git${SRCPV}"

# Tag: R8.7_SP1
SRCREV = "3bad7e76e820869f3a276bf02617c17096e28321"
BRANCH = "master"
SRC_URI = " \
	git://github.com/varigit/ti-wl18xx-fw.git;protocol=git;branch=${BRANCH} \
	file://0001-Add-Makefile-for-SDK.patch \
"
