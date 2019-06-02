#!/usr/bin/env bash
set -e
echo "Starting..."

CONSTRAINTS_FILE=/packaging/constraints.txt

if test -f /packaging/extra-packaging-instructions.sh
then
    source /packaging/extra-packaging-instructions.sh
fi

if test ${CONSTRAINTS_FILE}
then
    echo "## /packaging/$CONSTRAINTS_FILE exist"
    wagon create -s . -r -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}''
else
    echo "## /packaging/$CONSTRAINTS_FILE doesn't exist"
    wagon create -s . -r -v -f
fi
