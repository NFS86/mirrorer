FROM debian:buster
LABEL maintainer="NFS86 <jarbull86@gmail.com>"

ENV USERNAME=NOBODY
ENV PASSWORD=CHANGEME
WORKDIR /github/mirrorer

RUN apt-get update && apt-get install curl wget unzip ca-certificates fuse openssh-client gnupg2 -y && \
curl https://mega.nz/linux/MEGAsync/Debian_10.0/amd64/megacmd-Debian_10.0_amd64.deb --output megacmd.deb && \
echo path-include /usr/share/doc/megacmd/* > /etc/dpkg/dpkg.cfg.d/docker && \
apt install ./megacmd.deb -y && \
wget -qO- https://rclone.org/install.sh | bash && \
apt-get remove -y curl && \
apt-get clean

WORKDIR /github/mirrorer
VOLUME ["/github/mirrorer"]
ENTRYPOINT ["/bin/bash"]