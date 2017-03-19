FROM ubuntu:latest

MAINTAINER ikeda <ikeda.masaki@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openssh-server

ADD sshd_config /etc/ssh/
RUN mkdir -p /var/run/sshd

EXPOSE 22

ADD run.sh /
CMD ["/run.sh"]

