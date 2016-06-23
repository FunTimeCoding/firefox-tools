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

# C SSL Client
# V SSL Server
# L SSL CA
# A Any CA
# Y Verify CA
# S Email signer
# R Email Recipient
# O OCSP status responder
# J Object signer
CERTIFICATE_USAGE=Y
certutil -d "${DATABASE_DIRECTORY}" -V -u "${CERTIFICATE_USAGE}" -n "${CERTIFICATE_NAME}"
