# Build dock image:
#    docker build -t dev:ubuntu -f Dockerfile .
#
# Run dock container:
#    docker run --name dev  -it dev:ubuntu

FROM base:ubuntu

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux \
    # install
    && apt-get install -y \
        build-essential \
        wget
