#!/bin/bash

function ShowHelp()
{
    echo "It will clone repositories that not exist in the local,"
    echo "   and update repositories that already exist."
    echo "Note: Execute this script in the projects' base directory."
    echo
    echo "Usage: $0  [repo-base-url]"
    echo
    echo "To run the script for the first time, url is required. For example:"
    echo "    $0  http://github.com/fanhongtao"
    echo
    echo "To update local repositories, url is not needed. For example:"
    echo "    $0"
    exit 1
}

# create directory if it doesn't exist
function create_dir()
{
    if [ ! -d $1 ]; then
        mkdir -p $1
    fi
}

function clone_repo()
{
    repo=$1
    repo_name=${repo##*/}
    if [ $repo != $repo_name ]; then
        repo_path=${line%/*}
        create_dir  $repo_path
        cd $repo_path
    fi

    repo_url=${repo_base_url}/${repo}.git
    git clone $repo_url
    echo
}

function pull_repo()
{
    repo_dir=$1
    echo "Pulling $repo_dir ..."
    cd $repo_dir
    git pull
    echo
}

base_dir=`pwd`
project=".project"
repo_base_url=""

# If .project exist, update it, and get repo_base_url from it.
if [ -d $project ]; then
    pull_repo $project
    repo_url=`git remote -v | awk '{print $2; exit}'`
    repo_base_url=${repo_url%/*}
fi

cd $base_dir
# Check if we need to clone .project.git
if [ "x$repo_base_url" == "x" ]; then
    # check args
    if [ $# -ne 1 ]; then
        ShowHelp
    fi
    repo_base_url=$1

    clone_repo  $project
fi


project_file=".project/project.list"
if [ ! -f $project_file ]; then
    echo "Can't find file $project_file"
    exit 1
fi

# Clone/pull repositories listed in the project.list
while read line
do
    cd $base_dir
    if [ -d $line ]; then
        pull_repo ${base_dir}/${line}
    else
        clone_repo $line
    fi
done < $project_file

