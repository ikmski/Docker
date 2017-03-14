#!/bin/bash

if [ -z "{$TARGET_DIR}" ]; then
    echo FATAL: TARGET_DIR not defined 1>&2
    exit 1;
fi

NAME=${NAME:-backup}

DATETIME=`date '+%Y%m%d%H%M%S'`
BACKUP_FILE=${NAME}_${DATETIME}.tar.gz

cd ${TARGET_DIR}
tar czvf /export/${BACKUP_FILE} .
