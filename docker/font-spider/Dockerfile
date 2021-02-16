# Build dock image:
#    docker build -t font-spider:latest .
#
# In html directory, run dock container:
#    docker run -it --rm -v "$PWD":/data font-spider /data/*.html

FROM alpine

MAINTAINER Fan Hongtao <fanhongtao@gmail.com>

RUN set -eux \
# Switch mirrors for Alpine
    && cp /etc/apk/repositories /etc/apk/repositories.bak \
    && echo "http://mirrors.aliyun.com/alpine/v3.12/main/" > /etc/apk/repositories \
# Install
    && apk add --no-cache npm \
    && npm config set registry https://registry.npm.taobao.org

RUN npm install font-spider -g;

ENTRYPOINT [ "font-spider" ]
