#!/bin/bash
# 停止指定的 Wiki 

function ShowHelp()
{
    echo "使用方法："
    echo "    stop_wiki.sh  wiki_path"
    echo " 如："
    echo "    stop_wiki.sh  ~/wiki/study"
    echo "如果路径唯一，可以简写为"
    echo "    stop_wiki.sh  study"
}

if [ $# -eq 0 ]; then
    ShowHelp
    exit 1
fi

wiki_path=$1
ps -ef | grep gollum | grep $wiki_path | while read line
do
    pid=`echo $line | awk '{print $2}'`
    echo "kill wiki:"
    echo "$line"
    kill -9 $pid
done

exit 0

