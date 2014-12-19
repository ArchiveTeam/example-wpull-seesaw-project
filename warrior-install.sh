#!/bin/sh -e

VERSION='0.1003'
TARBALL='wpull-0.1003.exe.linux-i686-3.2.tar.gz'
CHECKSUM=843d34b1aecf757bd1f04efa472fea34
DOWNLOAD_URL="https://launchpad.net/wpull/trunk/v${VERSION}/+download/${TARBALL}"
INSTALL_DIR="${HOME}/.local/share/wpull-${VERSION}/"

if [ ! -e "${INSTALL_DIR}/wpull" ]; then
    echo "Downloading Wpull"
    wget $DOWNLOAD_URL --continue --directory-prefix /tmp/

    echo "Verify checksum"
    RESULT_CHECKSUM=`md5sum "/tmp/${TARBALL}" | cut -f 1 -d " "`
    if [ "$RESULT_CHECKSUM" != "$CHECKSUM" ]; then
        echo "Checksum failed. Got ${RESULT_CHECKSUM}. Need ${CHECKSUM}"
        exit 1
    fi

    echo "Extracting contents to ${INSTALL_DIR}"
    mkdir -p "${INSTALL_DIR}"
    tar -xzf "/tmp/${TARBALL}" --strip-components 1 --directory "${INSTALL_DIR}"
    
    echo Done
fi
