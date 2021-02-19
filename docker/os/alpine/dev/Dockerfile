# Build dock image:
#    docker build -t dev:alpine -f Dockerfile .
#
# Run dock container:
#    docker run --name dev-alpine  -it dev:alpine

FROM base:alpine

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux \
# install
    && apk add --no-cache \
            cmake \
            g++ \
            gcc \
            icu-dev \
            libc-dev \
            make \
            openssl-dev \
            wget
