#!/usr/bin/env bash
set -e
echo "Starting..."

# alias python=/usr/local/bin/python3.11

CONSTRAINTS_FILE=/packaging/constraints.txt
REQUIRMENTS_FILE=/packaging/requirements-3.6.txt
DEV_REQUIREMENTS_FILE=/packaging/dev-requirements.txt

if test -f ${REQUIRMENTS_FILE}
then
    echo "## $REQUIRMENTS_FILE exists"
else
    REQUIRMENTS_FILE=$DEV_REQUIREMENTS_FILE
fi

if test -f /packaging/extra-packaging-instructions.sh
then
    source /packaging/extra-packaging-instructions.sh
fi
source /env/bin/activate
echo "manylinux1_compatible = False" > "/env/bin/_manylinux.py"
if test -f ${CONSTRAINTS_FILE}
then
    echo "## $CONSTRAINTS_FILE exist"
    wagon create -r ${REQUIRMENTS_FILE} --build-tag "centos-Core" -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}'' .
else
    echo "## $CONSTRAINTS_FILE doesn't exist"
    wagon create -r ${REQUIRMENTS_FILE} --build-tag "centos-Core" -v -f .
fi

cp -R * /workspace/build/
