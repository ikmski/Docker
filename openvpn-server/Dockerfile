FROM ubuntu:latest

MAINTAINER ikeda <ikeda.masaki@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openvpn easy-rsa libssl-dev openssl

ENV COUNTRY="US" \
    PROVINCE="CA" \
    CITY="SanFrancisco" \
    ORG="Fort-Funston" \
    EMAIL="me@myhost.mydomain" \
    OU="MyOrganizationalUnit"

ARG ip_address="192.168.0.1"

# EasyRSA
RUN make-cadir /etc/openvpn/easy-rsa

WORKDIR /etc/openvpn/easy-rsa

RUN sed -i -e "s/^export KEY_COUNTRY=\".*\"/export KEY_COUNTRY=\"${COUNTRY}\"/" /etc/openvpn/easy-rsa/vars && \
    sed -i -e "s/^export KEY_PROVINCE=\".*\"/export KEY_PROVINCE=\"${PROVINCE}\"/" /etc/openvpn/easy-rsa/vars && \
    sed -i -e "s/^export KEY_CITY=\".*\"/export KEY_CITY=\"${CITY}\"/" /etc/openvpn/easy-rsa/vars && \
    sed -i -e "s/^export KEY_ORG=\".*\"/export KEY_ORG=\"${ORG}\"/" /etc/openvpn/easy-rsa/vars && \
    sed -i -e "s/^export KEY_EMAIL=\".*\"/export KEY_EMAIL=\"${EMAIL}\"/" /etc/openvpn/easy-rsa/vars && \
    sed -i -e "s/^export KEY_OU=\".*\"/export KEY_OU=\"${OU}\"/" /etc/openvpn/easy-rsa/vars

RUN /bin/bash -c ' \
    source ./vars; \
    ./clean-all; \
    ./build-dh; \
    ./pkitool --initca; \
    ./pkitool --server server; \
    ./pkitool client'

# OpenVPN
WORKDIR /etc/openvpn

RUN /bin/bash -c 'openvpn --genkey --secret ta.key'

ADD server.conf /etc/openvpn/

# ovpngen
WORKDIR /
ADD ovpngen /
RUN /ovpngen \
    ${ip_address} \
    /etc/openvpn/easy-rsa/keys/ca.crt \
    /etc/openvpn/easy-rsa/keys/client.crt \
    /etc/openvpn/easy-rsa/keys/client.key \
    /etc/openvpn/ta.key \
    > /client.ovpn

CMD ["openvpn", "/etc/openvpn/server.conf"]

