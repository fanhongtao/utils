#!/bin/bash
# Create a container for wiki, by image fanhongtao/gollum-alpine
#set -x

function ShowHelp()
{
    echo "Usage:"
    echo "    create_wiki_container.sh container_name wiki_path  [port [other_args] ]"
    echo "Examples:"
    echo "    create_wiki_container.sh study ~/wiki/study"
    echo "    create_wiki_container.sh wiki_temp ~/wiki/temp  4568"
    echo "    create_wiki_container.sh wiki_temp ~/wiki/temp  4568  -b /temp --no-edit"
}


if [ $# -lt 2 ]; then
    ShowHelp
    exit 1
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
docker create --name $container_name -i -t -p $port:4567 -v "$PWD":/wiki fanhongtao/gollum-alpine --allow-uploads dir $*

docker start $container_name

docker exec $container_name git config --global user.name "Fan Hongtao"
docker exec $container_name git config --global user.email "fanhongtao@gmail.com"

exit 0
