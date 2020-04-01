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
    wagon create -r ${REQUIRMENTS_FILE} -v -f -a '--no-cache-dir -c '${CONSTRAINTS_FILE}'' .
else
    echo "## $CONSTRAINTS_FILE doesn't exist"
    wagon create -r ${REQUIRMENTS_FILE} -v -f .
fi

echo "appending platform to wagon file name"
OS_DIST=$(python -c 'import platform; print(platform.linux_distribution(full_distribution_name=False)[0])')
OS_RELEASE=$(python -c 'import platform; print(platform.linux_distribution(full_distribution_name=False)[2])')
ls /packaging/*.wgn | sed 'p;s/\.wgn/\-'${OS_DIST}'-'${OS_RELEASE}'.wgn/' | xargs -n2 mv

cp -R * /workspace/build/
