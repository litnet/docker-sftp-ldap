FROM debian:stretch
MAINTAINER Adrian Dvergsdal [atmoz.net]

RUN apt-get update && \
    apt-get -y install openssh-server nslcd && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd

COPY nsswitch.conf /etc/nsswitch.conf
COPY entrypoint /

EXPOSE 22


ENTRYPOINT ["/entrypoint"]
