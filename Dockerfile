FROM debian:stretch
MAINTAINER Adrian Dvergsdal [atmoz.net]

# Steps done in one RUN layer:
# - Install packages
# - OpenSSH needs /var/run/sshd to run
# - Remove generic host keys, entrypoint generates unique keys
RUN apt-get update && \
    apt-get -y install openssh-server nslcd && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd

#COPY sshd_config /etc/ssh/sshd_config
COPY nsswitch.conf /etc/nsswitch.conf
COPY entrypoint /

EXPOSE 22


ENTRYPOINT ["/entrypoint"]
