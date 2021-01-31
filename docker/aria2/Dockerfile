FROM alpine

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux; \
# Switch mirrors for Alpine
    cp /etc/apk/repositories /etc/apk/repositories.bak; \
    echo "http://mirrors.aliyun.com/alpine/v3.13/main/" > /etc/apk/repositories; \
    echo "http://mirrors.aliyun.com/alpine/v3.13/community/" >> /etc/apk/repositories; \
# Install
    apk add --no-cache aria2

RUN addgroup download; adduser -G download -D download
USER download
COPY ["aria2.conf", "entry-point.sh", "/startup/"]

WORKDIR /aria2

EXPOSE 6800 6888 6888/udp

ENTRYPOINT ["/startup/entry-point.sh"]
