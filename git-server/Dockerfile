FROM ubuntu:latest

MAINTAINER ikeda <ikeda.masaki@gmail.com>

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y openssh-server git supervisor

# SSH
ADD files/sshd_config /etc/ssh/
RUN mkdir -p /var/run/sshd

# SSH user
RUN adduser --disabled-password --shell /usr/bin/git-shell --gecos "" git
RUN gpasswd -a git sudo
RUN mkdir /home/git/.ssh && chmod 700 /home/git/.ssh;
ADD files/authorized_keys /home/git/.ssh/authorized_keys
RUN chown -R git:git /home/git/.ssh

# Git
RUN mkdir /opt/git
RUN chown -R git:git /opt/git

# supervisor
ADD files/ssh.supervisor.conf /etc/supervisor/conf.d/ssh.conf
ADD files/git.supervisor.conf /etc/supervisor/conf.d/git.conf

EXPOSE 22
EXPOSE 9418

COPY files/repositories.txt /
COPY run.sh /
CMD ["/run.sh"]
