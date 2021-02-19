# Build dock image:
#    docker build -t npm:alpine -f Dockerfile .
#
# Run dock container:
#    docker run --name npm-alpine  -it npm:alpine

FROM dev:alpine

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux \
    && apk add --no-cache npm \
    && npm config set registry https://repo.huaweicloud.com/repository/npm/

