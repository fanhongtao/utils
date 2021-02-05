#!/bin/sh

Download()
{
    url=$1
    name=`basename $url`
    if [ ! -f $name ]; then
       wget $url
    fi
}

Download "https://nginx.org/download/nginx-1.19.6.tar.gz"
Download "https://github.com/winshining/nginx-http-flv-module/archive/v1.2.8.tar.gz"
