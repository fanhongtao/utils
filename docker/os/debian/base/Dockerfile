# Build dock image:
#    docker build -t base:debian -f Dockerfile .
#
# Run dock container:
#    docker run --name base-debian  -it base:debian

FROM debian:buster

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

ENV LANG=C.UTF-8

RUN set -eux \
# Switch mirrors for Debian, visit https://mirrors.huaweicloud.com/ for more information.
    && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && sed -i "s@http://deb.debian.org@http://repo.huaweicloud.com@g" /etc/apt/sources.list \
    && sed -i "s@http://security.debian.org@http://repo.huaweicloud.com@g" /etc/apt/sources.list \
# update
    && apt-get update \
# install
    && apt-get install -y vim \
# set timezone to Shanghai
    && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

