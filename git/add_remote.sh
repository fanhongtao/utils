#!/bin/bash

function ShowHelp()
{
    echo "Add remote to existing local git repositories."
    echo "Note: Execute this script in the projects' base directory."
    echo
    echo "Usage: $0  repo-base-url  remote-name"
    echo "Example:"
    echo "    $0  git@github.com/fanhongtao  origin"
    exit 1
}

# check args
script_path=${0%/*}
. $script_path/include.sh
CheckForHelp $@
if [ $# -ne 2 ]; then
    ShowHelp
fi

base_dir=`pwd`
project_file=".project/project.list"
repo_base_url=$1
remote_name=$2

while read line
do
    echo "Add remote to $line"
    repo_dir=${base_dir}/${line}
    cd $repo_dir
    if [ $? -ne 0 ]; then
        echo "Can't enter directory [$repo_dir]."
        continue
    fi

    git remote add $remote_name  ${repo_base_url}/${line}.git
done < $project_file

