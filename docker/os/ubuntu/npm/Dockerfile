# Build dock image:
#    docker build -t npm:ubuntu -f Dockerfile .
#
# Run dock container:
#    docker run --name npm-ubuntu  -it npm:ubuntu

FROM dev:ubuntu

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux \
    && apt-get install -y npm
RUN npm config set registry https://repo.huaweicloud.com/repository/npm/
