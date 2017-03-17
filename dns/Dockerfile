FROM ubuntu:latest

MAINTAINER ikeda <ikeda.masaki@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y bind9 dnsutils

ADD conf/* /etc/bind/

CMD ["/usr/sbin/named", "-f"]
