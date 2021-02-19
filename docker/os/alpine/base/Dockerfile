# Build dock image:
#    docker build -t base:alpine -f Dockerfile .
#
# Run dock container:
#    docker run --name base-alpine  -it base:alpine

FROM alpine:3.13

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

ENV LANG=C.UTF-8

RUN set -eux \
# Switch mirrors for Alpine, visit https://mirrors.huaweicloud.com/ for more information.
	&& cp /etc/apk/repositories /etc/apk/repositories.bak \
	&& sed -i "s@https://dl-cdn.alpinelinux.org/@http://repo.huaweicloud.com/@g" /etc/apk/repositories \
# set timezone to Shanghai
    && apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

