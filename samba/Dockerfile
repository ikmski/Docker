FROM ubuntu:latest

MAINTAINER ikeda <ikeda.masaki@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y samba

ADD smb.conf /etc/samba/

VOLUME /var/samba/
EXPOSE 137/udp 138/udp 139/tcp 445/tcp

CMD ["/usr/sbin/smbd", "-F"]
