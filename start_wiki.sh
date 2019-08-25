#!/bin/bash
# 启动指定的 Wiki 

function ShowHelp()
{
    echo "使用方法："
    echo "    start_wiki.sh  wiki_path  [port [base_path]]"
    echo " 如："
    echo "    start_wiki.sh  ~/wiki/study"
    echo "    start_wiki.sh  ~/wiki/temp  4568"
    echo "    start_wiki.sh  ~/wiki/temp  4568  /temp"
}

if [ $# -eq 0 ]; then
    ShowHelp
    exit 1
fi

wiki_path=$1
count=`ps -ef | grep gollum | grep $wiki_path | wc | gawk '{print $1}'`
if [ $count -ne 0 ]; then
    echo "Wiki [$wiki_path] already started."
    exit 0
fi

if [ $# -eq 1 ]; then
    port=4567  # gollum 缺省使用 4567 端口
else
    port=$2
fi

cd $wiki_path
if [ $# -gt 2 ]; then
  nohup gollum --mathjax --port $port --allow-uploads page --adapter rugged --js --css -b $3 $wiki_path &
else
  nohup gollum --mathjax --port $port --allow-uploads page --adapter rugged --js --css $wiki_path &
fi

exit 0
