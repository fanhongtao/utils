FROM ruby:alpine3.10

MAINTAINER Fan Hongtao <fanhongtao@gmail.com>

RUN apk update \
    && apk add --no-cache make gcc g++ libc-dev icu-dev cmake openssl-dev icu-libs git \
    && gem install gollum  github-markdown gollum-rugged_adapter \
    && apk del make gcc g++ libc-dev icu-dev cmake openssl-dev

WORKDIR /wiki

EXPOSE 4567

CMD gollum --mathjax --allow-uploads dir --adapter rugged
