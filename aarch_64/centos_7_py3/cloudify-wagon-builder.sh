#!/usr/bin/env bash
set -e
echo "Starting..."

CONSTRAINTS_FILE=/packaging/constraints.txt
REQUIRMENTS_FILE=/packaging/dev-requirements.txt

if test -f /packaging/extra-packaging-instructions.sh
then
    source /packaging/extra-packaging-instructions.sh
fi
source /env/bin/activate
echo "manylinux1_compatible = False" > "/env/bin/_manylinux.py"
if test -f ${CONSTRAINTS_FILE}
then
    echo "## $CONSTRAINTS_FILE exist"
    wagon create -r ${REQUIRMENTS_FILE} --build-tag "aarch-64" -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}'' .
else
    echo "## $CONSTRAINTS_FILE doesn't exist"
    wagon create -r ${REQUIRMENTS_FILE} --build-tag "aarch-64" -v -f .
fi

cp -R * /workspace/build/
