FROM ruby:alpine3.10

MAINTAINER Fan Hongtao <fanhongtao@gmail.com>

RUN apk update \
    && apk add --no-cache make gcc g++ libc-dev icu-dev cmake openssl-dev icu-libs git \
    && gem install gollum  github-markdown gollum-rugged_adapter \
    && apk del make gcc g++ libc-dev icu-dev cmake openssl-dev

# Fix bug for gollum-rugged_adapter v0.4.4
RUN cd /usr/local/bundle/gems/gollum-rugged_adapter-0.4.4/lib/rugged_adapter \
    && mv git_layer_rugged.rb git_layer_rugged.rb.old \
    && wget https://raw.githubusercontent.com/gollum/rugged_adapter/11b3d06d35f530b54f1fbcf644699f06b910791f/lib/rugged_adapter/git_layer_rugged.rb -O git_layer_rugged.rb

WORKDIR /wiki

EXPOSE 4567

CMD gollum --mathjax --allow-uploads dir --adapter rugged
