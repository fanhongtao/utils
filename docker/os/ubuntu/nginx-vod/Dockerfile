# Build dock image:
#    docker build -t nginx-vod:ubuntu -f Dockerfile .
#
# Run dock container:
#    docker run --name nginx-vod -p 80:80 -p 1935:1935 -v "$PWD":/usr/local/nginx/html/ -d nginx-vod:ubuntu

FROM dev:ubuntu

LABEL maintainer="Fan Hongtao <fanhongtao@gmail.com>"

RUN set -eux \
    # install
    && apt-get install -y \
        libpcre3-dev \
        zlib1g-dev \
        libssl-dev \
        libperl-dev

ADD nginx-1.19.6.tar.gz /home
# nginx-http-flv-module v1.2.8
ADD v1.2.8.tar.gz /home

RUN cd /home/nginx-1.19.6 \
    && ./configure --add-module=/home/nginx-http-flv-module-1.2.8 \
    && make \
    && make install \
    \
# forward request and error logs to docker log collector
    && ln -sf /dev/stdout /usr/local/nginx/logs/access.log \
    && ln -sf /dev/stderr /usr/local/nginx/logs/error.log

EXPOSE 80 1935

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
