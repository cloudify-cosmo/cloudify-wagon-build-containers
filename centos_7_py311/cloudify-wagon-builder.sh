#!/usr/bin/env bash
set -e
echo "Starting..."

alias python=/usr/local/bin/python3.11
# cat << EOF > $HOME/pip.conf
# [global]
# quiet = 0
# verbose = 2
# trusted-host =
#    insert-url
# EOF
# export PIP_CONFIG_FILE=$HOME/pip.conf

CONSTRAINTS_FILE=/packaging/constraints.txt
REQUIRMENTS_FILE=/packaging/dev-requirements.txt

if test -f /packaging/extra-packaging-instructions.sh
then
    source /packaging/extra-packaging-instructions.sh
fi
source /env/bin/activate

if test -f ${CONSTRAINTS_FILE}
then
    echo "## $CONSTRAINTS_FILE exist"
    wagon create -r ${REQUIRMENTS_FILE} --build-tag "manylinux" -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}'' .
else
    echo "## $CONSTRAINTS_FILE doesn't exist"
    wagon create -r ${REQUIRMENTS_FILE} --build-tag "manylinux" -v -f .
fi

cp -R * /workspace/build/
