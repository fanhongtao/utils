#
# Build dock image:
#    docker build -t fanhongtao/gollum-alpine:5.2.2 -t fanhongtao/gollum-alpine:latest .
#
# In wiki directory (git repository), create or run dock container:
#    docker create --name gollum-alpine -i -t -p 4567:4567 -v "$PWD":/wiki gollum-alpine
#  or
#    docker run --name gollum-alpine -i -t -p 4567:4567 -v "$PWD":/wiki gollum-alpine
#
# (Re)Start container:
#    docker start gollum-alpine
#
# Stop container:
#    docker stop gollum-alpine

FROM ruby:2.7.2-alpine3.12

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux \
# Switch mirrors for Alpine & Ruby
    && cp /etc/apk/repositories /etc/apk/repositories.bak \
    && sed -i "s@http://dl-cdn.alpinelinux.org/@http://mirrors.aliyun.com/@g" /etc/apk/repositories \
    && gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \
# Install
    && apk update \
    && apk add --no-cache --virtual .run-deps \
            git \
            icu-libs \
    && apk add --no-cache --virtual .build-deps \
            cmake \
            g++ \
            gcc \
            icu-dev \
            libc-dev \
            make \
            openssl-dev \
    && gem install github-linguist \
    && gem install gollum -v 5.2.2 \
# Delete unnecessary packages
    && apk del .build-deps

RUN addgroup wiki; adduser -G wiki -D wiki
USER wiki

VOLUME /wiki
WORKDIR /wiki

EXPOSE 4567

ENTRYPOINT [ "gollum" ]
