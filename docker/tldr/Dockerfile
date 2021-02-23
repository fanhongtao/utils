FROM alpine:3.13

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

ENV LANG=C.UTF-8

RUN set -eux \
# Switch mirrors for Alpine, visit https://mirrors.huaweicloud.com/ for more information.
    && cp /etc/apk/repositories /etc/apk/repositories.bak \
    && sed -i "s@https://dl-cdn.alpinelinux.org/@http://repo.huaweicloud.com/@g" /etc/apk/repositories \
# install
    && apk add --no-cache \
        coreutils \
        git

RUN wget -O /bin/tldr https://raw.githubusercontent.com/fanhongtao/tldr-sh-client/master/tldr \
    && chmod +x /bin/tldr

# add user
RUN addgroup -g 1000 tldr \
    && adduser -u 1000 -G tldr -s /bin/sh -D tldr
USER tldr

# set GIT to rebase divergent branches
RUN git config --global pull.rebase true

ENTRYPOINT ["/bin/tldr"]
