# Buckup Data Volume Container

## Build
```
$ docker build -t ikmski/datavolume-backup .
```

## Run
```
$ docker run --rm --volumes-from <data volume container> -v $(pwd):/export -e TARGET_DIR=<target dir> ikmski/datavolume-backup
```
