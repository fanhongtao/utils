FROM alpine:3.13

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux \
# Switch mirrors for Alpine, visit https://mirrors.huaweicloud.com/ for more information.
    && cp /etc/apk/repositories /etc/apk/repositories.bak \
    && sed -i "s@https://dl-cdn.alpinelinux.org/@http://repo.huaweicloud.com/@g" /etc/apk/repositories \
# add user
    && addgroup -g 1000 tldr \
    && adduser -u 1000 -G tldr -s /bin/sh -D tldr \
# install
    && apk add --no-cache \
        bash \
        coreutils \
        ncurses \
        git

# Set environment 
ENV LANG=C.UTF-8 \
    TLDR_HEADER='magenta bold underline' \
    TLDR_QUOTE='italic' \
    TLDR_DESCRIPTION='green' \
    TLDR_CODE='white' \
    TLDR_PARAM='yellow' \
    TLDR_VALUE='cyan'

# download tldr
RUN wget -O /bin/tldr https://raw.githubusercontent.com/fanhongtao/tldr-sh-client/master/tldr \
    && chmod +x /bin/tldr

USER tldr

# set GIT to rebase divergent branches
RUN git config --global pull.rebase true

ENTRYPOINT ["/bin/tldr"]
