FROM ubuntu:12.04
MAINTAINER Chris Stephan <cstephan@squaremouth.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get -y install \
      software-properties-common \
      curl \
      git \
      wget \
      build-essential \
      openssh-server \
      supervisor

RUN mkdir /var/run/sshd && \
    chown root /var/run/sshd && \
    echo 'root:root' | chpasswd

EXPOSE 22
