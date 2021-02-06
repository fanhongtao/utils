#!/bin/bash
# Build a docker image.

# set -x

ShowHelp()
{
    prog=$1
    echo """Usage:
    $prog [-f] image-dir

Option:
    -f      Force build parent image(s).

Example:
    $prog  nginx-vod
    $prog -f nginx-vod
"""
}

Build()
{
    local image_dir=$1
    
    # Check where base image is exist
    cd $base_dir/$image_dir
    parent_image=`cat Dockerfile | grep FROM | awk '{print $2;exit}'`
    count=`docker image ls $parent_image | wc -l`
    if [ $count == 1 -o $force == 1 ] && [ $image_dir != "base" ]; then
        parent_dir=`echo $parent_image | awk -F":" '{print $1}'`
        Build $parent_dir
        echo -e "================================================\n\n"
    fi
    
    echo "Building $image_dir ..."
    cd $base_dir/$image_dir
    if [ -f prepare.sh ]; then
        ./prepare.sh
    fi
	echo "docker build -t $image_dir:ubuntu -f Dockerfile ."
    docker build -t $image_dir:ubuntu -f Dockerfile .
}

# ====== main =======
force=0
if [ $# -gt 0 -a "$1" == "-f" ]; then
    force=1
    shift
fi

if [ $# -eq 0 ]; then
    ShowHelp `basename $0`
    exit 1
fi

base_dir=`pwd`
Build `basename $1`
