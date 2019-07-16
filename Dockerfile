FROM jenkins/jenkins:alpine
LABEL maintainer="Tao Wang <moonavw@gmail.com>"

USER root

# https://wiki.alpinelinux.org/wiki/Docker
RUN apk add --update docker

RUN apk add --update py-pip \
    python-dev libffi-dev openssl-dev gcc libc-dev make \
    && pip install docker-compose

RUN apk add --update shadow \
    && groupadd -g 50 staff \
    && usermod -a -G staff jenkins

USER jenkins
