#!/bin/bash

set -euo pipefail

echo "Updating ClamAV scan DB"
set +e
freshclam
FRESHCLAM_EXIT=$?
set -e

if [[ "$FRESHCLAM_EXIT" -eq "0" ]]; then
    echo "Freshclam updated the DB"
elif [[ "$FRESHCLAM_EXIT" -eq "1" ]]; then
    echo "ClamAV DB already up to date..."
else
    echo "An error occurred (freshclam returned with exit code '$FRESHCLAM_EXIT')"
    exit $FRESHCLAM_EXIT
fi

echo "Scanning $DIRTOSCAN"
clamscan -r $DIRTOSCAN $@