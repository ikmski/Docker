# Unity Cache Server

### Build
```
$ docker build -t ikmski/unity-cache-server .
```

### Run
```
$ docker run -d \
    -v cache-data:/opt/cache \
    -v /etc/localtime:/etc/localtime:ro \
    -p 8126:8126 \
    --name unity-cache-server \
    ikmski/unity-cache-server
```

## Docker Compose

### Run
```
$ docker-compose up -d
```

