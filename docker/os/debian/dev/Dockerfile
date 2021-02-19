# Build dock image:
#    docker build -t dev:debian -f Dockerfile .
#
# Run dock container:
#    docker run --name dev-debian  -it dev:debian

FROM base:debian

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux \
# install
    && apt-get install -y \
        build-essential \
        wget
