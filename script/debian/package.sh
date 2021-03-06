#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)
# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../../configuration/project.sh"

script/debian/generate-manual.sh
ARCHIVE="${PROJECT_NAME_DASH}_${PROJECT_VERSION}.orig.tar.gz"
PROJECT_ROOT="${PROJECT_NAME_DASH}-${PROJECT_VERSION}"

if [ ! -f debian/changelog ]; then
    dch --create -v "${COMBINED_VERSION}" --package "${PROJECT_NAME_DASH}"
fi

mkdir -p build
tar --create --gzip --transform "s,^,${PROJECT_ROOT}/," --exclude='./build' --exclude './tmp' --exclude './.idea' --exclude './.git' --exclude './.vagrant' --exclude './.venv' --exclude './.scannerwork' --file "build/${ARCHIVE}" .
cd build
tar --extract --file "${ARCHIVE}"
cd "${PROJECT_ROOT}"
debuild -us -uc
