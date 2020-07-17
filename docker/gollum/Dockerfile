FROM ruby:2.7.1-alpine3.12

MAINTAINER Fan Hongtao <fanhongtao@gmail.com>

RUN \
# Switch mirrors for Alpine & Ruby
    cp /etc/apk/repositories /etc/apk/repositories.bak \
    && echo "http://mirrors.aliyun.com/alpine/v3.12/main/" > /etc/apk/repositories \
    && gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \
# Install
    && apk update \
    && apk add --no-cache make gcc g++ libc-dev icu-dev cmake openssl-dev icu-libs git \
    && gem install github-linguist -v 7.9.0 \
    && gem install gollum -v 5.0.1 \
# Delete unnecessary packages
    && apk del make gcc g++ libc-dev icu-dev cmake openssl-dev

WORKDIR /wiki

EXPOSE 4567

ENTRYPOINT [ "gollum", "--mathjax", "--port", "4567", "--allow-uploads", "page", "--adapter", "rugged", "--js", "--css", "-c", "config.rb", "/wiki" ]
