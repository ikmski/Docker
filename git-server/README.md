# Git Server

### Build
```
$ docker build -t ikmski/git-server .
```

### Run
```
$ docker run -d \
    -v git-data:/opt/git \
    -v /etc/localtime:/etc/localtime:ro \
    -p 2222:22 \
    -p 9418:9418 \
    --name git-server \
    ikmski/git-server
```

### Backup
```
$ docker run \
    --rm \
    -v git-data:/opt/git \
    -v /etc/localtime:/etc/localtime:ro \
    -v $(pwd)/backup:/export \
    -e TARGET_DIR=/opt/git \
    -e NAME=git-backup \
    ikmski/datavolume-backup
```

### Restore
```
$ docker run \
    --rm \
    -v git-data:/opt/git \
    -v $(pwd)/backup:/import \
    -e TARGET_DIR=/opt/git \
    -e BACKUP_FILE=<backup file> \
    ikmski/datavolume-restore
```

## Docker Compose

### Run
```
$ docker-compose up -d git
```

### Backup
```
$ docker-compose run --rm backup
```

### Restore
```
$ docker-compose run --rm -e BACKUP_FILE=<backup file> restore
```

