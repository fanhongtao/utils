# Build dock image:
#    docker build -t base:ubuntu -f Dockerfile .
#
# Run dock container:
#    docker run --name ubuntu-focal  -it base:ubuntu

FROM ubuntu:focal

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux; \
# Switch mirrors for Ubuntu
    cp /etc/apt/sources.list /etc/apt/sources.list.bak; \
    sed -i 's/security.ubuntu/mirrors.huaweicloud/g' /etc/apt/sources.list; \
    sed -i 's/archive.ubuntu/mirrors.huaweicloud/g' /etc/apt/sources.list; \
# update
    apt-get update; \
# install
    apt-get install -y vim
