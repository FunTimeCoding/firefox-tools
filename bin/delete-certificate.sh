#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)

usage()
{
    echo "Usage: ${0} CERTIFICATE_NAME"
    echo "Example: ${0} example.org.node-certificate.pem"
    echo "Example: ${0} example.org.wildcard-certificate.pem"
}

# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../lib/firefox_tools.sh"
CERTIFICATE_NAME="${1}"

if [ "${CERTIFICATE_NAME}" = "" ]; then
    usage

    exit 1
fi

certutil -d "${DATABASE_DIRECTORY}" -D -n "${CERTIFICATE_NAME}"
