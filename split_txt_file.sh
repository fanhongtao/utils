#!/bin/bash
# 在将下载的 txt 转换为电子书时，通常会需要将一个大的 txt 文件分拆成多个小 txt 文件。
# 本脚本根据 txt 文件中的“第 xx 章” 这样的章节编号，实现对文件进行分拆。
# 脚本假设每个章节的数字差不多，所以是按照章节的个数来进行分拆的。

function ShowHelp()
{
    echo "使用方法："
    echo "    $1  txt_file  split_num"
    echo " 如："
    echo "    $1  1.txt  5"
}

if [ $# -ne 2 ]; then
    ShowHelp `basename $0`
    exit 1
fi

txt_file=$1
split_num=$2
mulu="mulu.txt"
grep -n -E "第([0-9]+|(一|二|三|四|五|六|七|八|九|零|十|百|千)+)章" $txt_file > $mulu
line_num=`wc -l $mulu | awk '{print $1}'`
average=`expr $line_num / $split_num`

args=""
current=$average
for i in $(seq 2 $split_num) ; do
    pos=`awk -v FS=":" -v curr=$current 'NR==curr {print $1}' $mulu`
    # pos=`sed -n "${current}p" $mulu | awk -v FS=":" '{print $1}'`
    args="$args $pos"
    current=`expr $current + $average`
done

prefix=`basename $txt_file .txt`
suffix="-%02d.txt"

# 删除分析后的文件（因为有改名，所以要先删除旧的文件）
rm "$prefix-"*

# 分析文件
csplit --prefix=$prefix --suffix-format=$suffix  $txt_file  $args

# 修改分拆后的文件名。将编号由 00 开始，转换成由 01 开始。
count=`ls "$prefix-"* | wc -l`
for file in `ls "$prefix-"* | sort -r` ; do
    newName="${prefix}-"`printf "%02d" ${count}`".txt"
    echo "mv $file to $newName"
    mv $file $newName
    let count=count-1
done
