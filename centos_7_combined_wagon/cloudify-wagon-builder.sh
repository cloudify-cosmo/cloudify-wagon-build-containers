#!/usr/bin/env bash
set -e
echo "Starting..."

CONSTRAINTS_FILE=/packaging/constraints.txt
REQUIRMENTS_FILE=/packaging/dev-requirements.txt
ARCHIVE_PATH=/workspace/wagons/

if test -f /packaging/extra-packaging-instructions.sh
then
    source /packaging/extra-packaging-instructions.sh
fi
source /$1/bin/activate
echo "manylinux1_compatible = False" > "/$1/bin/_manylinux.py"
if test -f ${CONSTRAINTS_FILE}
then
    echo "## $CONSTRAINTS_FILE exist"
    wagon create -r ${REQUIRMENTS_FILE} -o ${ARCHIVE_PATH} -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}'' .
else
    echo "## $CONSTRAINTS_FILE doesn't exist"
    wagon create -r ${REQUIRMENTS_FILE} -v -f .
fi

cp -R * /workspace/build/
