#!/usr/bin/env bash
set -e
echo "Starting..."

CONSTRAINTS_FILE=/packaging/constraints.txt

if test -f /packaging/extra-packaging-instructions.sh
then
    source /packaging/extra-packaging-instructions.sh
fi
source /env/bin/activate
echo "manylinux1_compatible = False" > "/env/bin/_manylinux.py"
if test -f ${CONSTRAINTS_FILE}
then
    echo "## $CONSTRAINTS_FILE exist"
    wagon create -s . -r -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}''
else
    echo "## $CONSTRAINTS_FILE doesn't exist"
    wagon create -s . -r -v -f
fi

cp -R * /workspace/build/
