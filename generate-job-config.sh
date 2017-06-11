#!/bin/sh -e

# shellcheck disable=SC2016
jjm --locator https://github.com/FunTimeCoding/firefox-tools.git --build-command ./build.sh --junit build/junit.xml > job.xml
