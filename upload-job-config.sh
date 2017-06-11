#!/bin/sh -e

~/src/jenkins-tools/bin/delete-job.sh firefox-tools || true
~/src/jenkins-tools/bin/put-job.sh firefox-tools job.xml
