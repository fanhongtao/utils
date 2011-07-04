#!/bin/bash

function ShowHelp()
{
    echo "Pull git repositories to the local."
    echo "Note: Execute this script in the projects' base directory."
    echo
    echo "Usage: $0  [ remote-name  [ branch-name ] ]"
    echo "Example:"
    echo "    $0                  Pull with default remote / default branch"
    echo "    $0  origin          Pull with remote 'origin', default branch"
    echo "    $0  origin  master  Pull with remote 'origin', branch 'master'" 
    echo "    $0  -h              Show this message"
    exit 1
}

# check args
script_path=${0%/*}
. $script_path/include.sh
CheckForHelp $@

base_dir=`pwd`
project_file=".project/project.list"
remote_name=""
branch_name=""
if [ $# -gt 0 ]; then
    remote_name=$1
    if [ $# -gt 1 ]; then
        branch_name=$2
    fi
fi

while read line
do
    repo_dir=${base_dir}/${line}
    echo "Pulling $repo_dir ..."

    cd $repo_dir
    if [ $? -ne 0 ]; then
        echo "Can't enter directory [$repo_dir]."
        continue
    fi

    git pull $remote_name  $branch_name
done < $project_file

