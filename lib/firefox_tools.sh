#!/bin/sh -e

if [ "$(command -v shyaml || true)" = "" ]; then
    echo "Command not found: shyaml"

    exit 1
fi

if [ "$(command -v realpath || true)" = "" ]; then
    echo "Command not found: realpath"

    exit 1
fi

function_exists()
{
    declare -f -F "${1}" > /dev/null

    return $?
}

CONFIG="${HOME}/.firefox-tools.yml"

while true; do
    case ${1} in
        --config)
            CONFIG=${2-}
            shift 2
            ;;
        --help)
            echo "Global usage: ${0} [--help][--config CONFIG]"

            if function_exists usage; then
                usage
            fi

            exit 0
            ;;
        *)
            break
            ;;
    esac
done

OPTIND=1

if [ -f "${CONFIG}" ]; then
    CONFIG=$(realpath "${CONFIG}")
else
    CONFIG=""
fi

PROJECTS_ROOT=$(shyaml get-value projects-root < "${CONFIG}" 2> /dev/null) || PROJECTS_ROOT="${HOME}/src"
PROJECTS_ROOT=$(python3 -c "from os.path import expanduser; print(expanduser('${PROJECTS_ROOT}'))")
export PROJECTS_ROOT
OPERATING_SYSTEM=$(uname)

if [ "${OPERATING_SYSTEM}" = Darwin ]; then
    PROFILES_DIRECTORY="${HOME}/Library/Application Support/Firefox"
else
    PROFILES_DIRECTORY="${HOME}/.mozilla/firefox"
fi

PROFILE=$(sed -n -e 's/^.*Path=//p' < "${PROFILES_DIRECTORY}/profiles.ini" | head -n 1)
PROFILE_DIRECTORY="${PROFILES_DIRECTORY}/${PROFILE}"
export PROFILE_DIRECTORY

# The 'sql' prefix means using new format in cert9.db and key4.db, the old format is in cert8.db and key3.db.
#DATABASE_DIRECTORY="sql:${HOME}/.pki/nssdb"
DATABASE_DIRECTORY="${PROFILE_DIRECTORY}"
export DATABASE_DIRECTORY
