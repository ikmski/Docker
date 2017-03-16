#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

TARGET_DIR=${SCRIPT_DIR}/backup
SAVE_NUM=5

count=0
for file in $(ls -1t ${TARGET_DIR}/*.tar.gz)
do
    count=$((count + 1))
    if [ ${count} -gt ${SAVE_NUM} ]; then
        rm ${file}
    fi
done
