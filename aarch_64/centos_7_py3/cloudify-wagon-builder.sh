#!/usr/bin/env bash
set -e
echo "Starting..."

CONSTRAINTS_FILE=/packaging/constraints.txt
REQUIRMENTS_FILE=/packaging/requirements.txt
DEV_REQUIREMENTS_FILE=/packaging/dev-requirements.txt

if test -f ${REQUIRMENTS_FILE}
then
    echo "## $REQUIRMENTS_FILE exists"
else
    REQUIRMENTS_FILE=$DEV_REQUIREMENTS_FILE
fi

localedef -c -f UTF-8 -i en_US en_US.UTF-8
export LC_ALL=en_US.UTF-8

if test -f /packaging/extra-packaging-instructions.sh
then
    source /packaging/extra-packaging-instructions.sh
fi

source /env/bin/activate

echo "manylinux1_compatible = False" > "/env/bin/_manylinux.py"

if test -f ${CONSTRAINTS_FILE}
then
    echo "## $CONSTRAINTS_FILE exist"
    wagon create -r ${REQUIRMENTS_FILE} --build-tag "centos-altarch" -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}'' .
else
    echo "## $CONSTRAINTS_FILE doesn't exist"
    wagon create -r ${REQUIRMENTS_FILE} --build-tag "centos-altarch" -v -f .
fi

cp -R * /workspace/build/
