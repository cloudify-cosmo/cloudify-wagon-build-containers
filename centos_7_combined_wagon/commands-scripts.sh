#!/usr/bin/env bash
/cloudify-wagon-builder.sh "py2env"
/cloudify-wagon-builder.sh "py3env"
/combine-wagons.sh "py2env"