#!/bin/bash
set -e

# add ssh user

if [ -z "$USER_NAME" ]; then
    echo FATAL: USER_NAME not defined 1>&2
    exit 1;
fi
if [ -z "$PASSWORD" ]; then
    echo FATAL: PASSWORD not defined 1>&2
    exit 1;
fi


# SSH user
adduser --disabled-password --gecos "" $USER_NAME
echo $USER_NAME:$PASSWORD | chpasswd

service ssh restart

tail -f /dev/null
