#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)

usage()
{
    echo "Usage: ${0} KEY_FILE"
    echo "Example: ${0} example.org.p12"
}

# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../lib/firefox_tools.sh"
KEY_FILE="${1}"

if [ "${KEY_FILE}" = "" ]; then
    usage

    exit 1
fi

PASSWORD=insecure-password
pk12util -i "${KEY_FILE}" -d "${PROFILE_DIRECTORY}/cert8.db" -W "${PASSWORD}"
