#!/usr/bin/env bash
set -e
echo "Start combine.."

WAGONS_PATH=/workspace/wagons/

source /$1/bin/activate
cd ${WAGONS_PATH}
wagon combine -o /packaging/ -v `ls /workspace/wagons/*.wgn`
cp -R * /workspace/build/
cd /packaging/


