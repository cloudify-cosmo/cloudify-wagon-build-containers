#!/usr/bin/env bash
set -e
echo "Starting..."

CONSTRAINTS_FILE=/packaging/constraints.txt
REQUIREMENTS_FILE=/packaging/dev-requirements.txt

if [[ -f /packaging/extra-packaging-instructions.sh ]]; then

    source /packaging/extra-packaging-instructions.sh
fi
source /$1/bin/activate
echo "manylinux1_compatible = False" > "/$1/bin/_manylinux.py"
if [[ -f "${CONSTRAINTS_FILE}" ]]; then
    echo "## $CONSTRAINTS_FILE exist"
    wagon create --pip /$1/bin/pip --pip /$2/bin/pip --pyver "27" --pyver "36" --build-tag "Ubuntu-trusty" -r ${REQUIREMENTS_FILE} -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}'' .
else
    echo "## $CONSTRAINTS_FILE doesn't exist"
    wagon create --pip /$1/bin/pip --pip /$2/bin/pip --pyver "27" --pyver "36" --build-tag "Ubuntu-trusty" -r ${REQUIREMENTS_FILE} -v -f .
fi

cp -R * /workspace/build/
