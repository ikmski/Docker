# DNS

### Build
```
$ docker build -t ikmski/dns .
```

### Run
```
$ docker run -d -p 53:53/udp --name dns ikmski/dns
```
