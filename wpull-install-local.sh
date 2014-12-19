#!/bin/sh -e

VERSION='0.1003'
INSTALL_DIR="wpull-local-packages/"

pip3 install wpull==$VERSION -t "${INSTALL_DIR}"
pip3 install cchardet -t "${INSTALL_DIR}"
