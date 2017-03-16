# Samba

### Build
```
$ docker build -t ikmski/samba .
```

### Run
```
$ docker run -d \
    -v samba-data:/var/samba \
    -v /etc/localtime:/etc/localtime:ro \
    -p 137:137/udp \
    -p 138:138/udp \
    -p 139:139/tcp \
    -p 445:445/tcp \
    --name samba \
    ikmski/samba
```

### Backup
```
$ docker run \
    --rm \
    -v samba-data:/var/samba \
    -v /etc/localtime:/etc/localtime:ro \
    -v $(pwd)/backup:/export \
    -e TARGET_DIR=/var/samba \
    -e NAME=samba-backup \
    ikmski/datavolume-backup
```

### Restore
```
$ docker run \
    --rm \
    -v samba-data:/var/samba \
    -v $(pwd)/backup:/import \
    -e TARGET_DIR=/var/samba \
    -e BACKUP_FILE=<backup file> \
    ikmski/datavolume-restore
```

## Docker Compose

### Run
```
$ docker-compose up -d samba
```

### Backup
```
$ docker-compose run --rm backup
```

### Restore
```
$ docker-compose run --rm -e BACKUP_FILE=<backup file> restore
```

