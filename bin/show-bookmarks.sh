#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)

usage()
{
    echo "Usage: ${0}"
}

# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../lib/firefox_tools.sh"
/usr/bin/sqlite3 "${PROFILE_DIRECTORY}/places.sqlite" "SELECT a.id AS ID, a.title AS Title, b.url AS URL, datetime(a.dateAdded/1000000,'unixepoch') AS DateAdded FROM moz_bookmarks AS a JOIN moz_places AS b ON a.fk = b.id"
