#!/bin/bash

if [ -z "{$TARGET_DIR}" ]; then
    echo FATAL: TARGET_DIR not defined 1>&2
    exit 1;
fi

if [ -z "{$BACKUP_FILE}" ]; then
    echo FATAL: BACKUP_FILE not defined 1>&2
    exit 1;
fi

tar xzvf /import/${BACKUP_FILE} -C ${TARGET_DIR}
