#!/bin/bash

cat /repositories.txt | while read repo
do
    cd /opt/git
    if [ ! -d $repo.git ]; then
        mkdir $repo.git
        cd $repo.git
        git init --bare
        touch git-daemon-export-ok
        chown -R git:git ./
    fi
done

# start
/usr/bin/supervisord

