# Build dock image:
#    docker build -t npm:debian -f Dockerfile .
#
# Run dock container:
#    docker run --name npm-debian  -it npm:debian

FROM dev:debian

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux \
    && apt-get install -y npm \
    && npm config set registry https://repo.huaweicloud.com/repository/npm/
