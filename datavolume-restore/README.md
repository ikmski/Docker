# Restore Data Volume Container

## Build
```
$ docker build -t ikmski/datavolume-restore .
```

## Run
```
$ docker run --rm --volumes-from <data volume container> -v $(pwd):/import -e TARGET_DIR=<target dir> -e BACKUP_FILE=<backup file> ikmski/datavolume-restore
```
