FROM node:latest

MAINTAINER ikeda <ikeda.masaki@gmail.com>

ADD src/ /src/

EXPOSE 8126

CMD ["node", "/src/main.js", "--nolegacy", "--silent", "--path", "/opt/cache/cache5.0"]
