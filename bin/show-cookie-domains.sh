#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)

usage()
{
    echo "Usage: ${0}"
}

# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../lib/firefox_tools.sh"
/usr/bin/sqlite3 "${PROFILE_DIRECTORY}/cookies.sqlite" "SELECT DISTINCT baseDomain FROM moz_cookies"
