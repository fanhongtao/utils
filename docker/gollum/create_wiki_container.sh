#!/bin/bash
# Create a container for wiki, by image fanhongtao/gollum-alpine
#set -x

function ShowHelp()
{
    cmd=$(basename "$0")
    cat <<EOF
Usage:
    $cmd container_name wiki_path  [port [other_args] ]

Examples:
    $cmd study ~/wiki/study
    $cmd wiki_temp ~/wiki/temp  4568
    $cmd wiki_temp ~/wiki/temp  4568  -b /temp --no-edit
EOF
}


if [ $# -lt 2 ]; then
    ShowHelp
    exit 0
fi

container_name=$1
wiki_path=$2
shift
shift

if [ $# -gt 0 ]; then
    port=$1
    shift
else
    port=4567  # use default port 4567
fi

cd $wiki_path
docker create \
    --name $container_name \
    -i -t \
    --restart=unless-stopped \
    -p $port:4567 \
    -v "$PWD":/wiki \
    fanhongtao/gollum-alpine \
        --mathjax \
        --adapter rugged \
        --js \
        --css \
        -c config.rb \
        --allow-uploads dir $*

docker start $container_name

docker exec $container_name git config --global user.name "Fan Hongtao"
docker exec $container_name git config --global user.email "fanhongtao@gmail.com"

exit 0
