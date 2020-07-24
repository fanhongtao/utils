FROM ruby:2.7.1-alpine3.12

MAINTAINER Fan Hongtao <fanhongtao@gmail.com>

RUN set -eux; \
# Switch mirrors for Alpine & Ruby
    cp /etc/apk/repositories /etc/apk/repositories.bak; \
    echo "http://mirrors.aliyun.com/alpine/v3.12/main/" > /etc/apk/repositories; \
    gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/; \
# Install
    apk add --no-cache --virtual .run-deps \
            git \
            icu-libs \
    ; \
    apk add --no-cache --virtual .build-deps \
            cmake \
            g++ \
            gcc \
            icu-dev \
            libc-dev \
            make \
            openssl-dev \
    ; \
    gem install github-linguist -v 7.9.0; \
    gem install gollum -v 5.0.1; \
# Delete unnecessary packages
    apk del .build-deps

RUN addgroup wiki; adduser -G wiki -D wiki
USER wiki

WORKDIR /wiki

EXPOSE 4567

ENTRYPOINT [ "gollum", "--mathjax", "--port", "4567", "--adapter", "rugged", "--js", "--css", "-c", "config.rb", "/wiki" ]
