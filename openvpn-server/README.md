# Open VPN server

### Build
```
$ docker build -t ikmski/openvpn-server .
```

### Run
```
$ docker run -d \
    --name openvpn-server \
    --cap-add=NET_ADMIN \
    --device=/dev/net/tun \
    -p 1194:1194/udp \
    ikmski/openvpn-server
```
