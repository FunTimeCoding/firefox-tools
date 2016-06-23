#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)
AUTHORITY_TRUST_ATTRIBUTES=false

usage()
{
    echo "Usage: ${0} [--authority] CERTIFICATE"
    echo "Example: ${0} example.org.node-certificate.pem"
    echo "Example: ${0} example.org.wildcard-certificate.pem"
}

if [ "${1}" = --authority ]; then
    shift
    AUTHORITY_TRUST_ATTRIBUTES=true
fi

# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../lib/firefox_tools.sh"
CERTIFICATE="${1}"

if [ "${CERTIFICATE}" = "" ]; then
    usage

    exit 1
fi

CERTIFICATE_NAME=$("${PROJECTS_ROOT}"/transport-layer-security-tools/bin/show-certificate-information.sh "${CERTIFICATE}" | grep DNSname || true)
CERTIFICATE_NAME=$(echo "${CERTIFICATE_NAME#*DNSname: }" | xargs)

if [ "${CERTIFICATE_NAME}" = "" ]; then
    CERTIFICATE_NAME=$(basename "${CERTIFICATE%.*}")
fi

if [ "${AUTHORITY_TRUST_ATTRIBUTES}" = true ]; then
    TRUST_ATTRIBUTES="CT,c,c"
else
    TRUST_ATTRIBUTES=",,"
fi

certutil -d "${DATABASE_DIRECTORY}" -A -t "${TRUST_ATTRIBUTES}" -n "${CERTIFICATE_NAME}" -i "${CERTIFICATE}"
