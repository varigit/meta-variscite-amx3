# remove bigger packages to save space on 256 MB Nand

DEVTOOLS_remove = "\
    git \
    packagegroup-core-buildessential \
    packagegroup-core-tools-debug \
"

UTILS_remove = " \
    valgrind \
    opencv-dev \
    pru-icss \
    strongswan \
"

EXTRA_PACKAGES_remove = " \
    opencv \
    nodejs \
    nodejs-npm \
    protobuf \
"
