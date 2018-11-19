#!/bin/bash

function ShowHelp()
{
    echo "Execute git command on all repositories."
    echo "Note: Execute this script in the projects' base directory."
    echo
    echo "Usage: $0  [ git-args ] ]"
    echo "Example:"
    echo "    $0  status          Show the working tree status of all repositories"
    echo "    $0  -h              Show this message"
    exit 1
}

# check args
script_path=${0%/*}
. $script_path/include.sh
CheckForHelp $@
if [ $# -lt 1 ]; then
    ShowHelp
fi

base_dir=`pwd`
project_file=".project/project.list"

while read line
do
    line=`echo $line | sed 's/\r//'`  # Remove '\r' in dos-format
    repo_dir=${base_dir}/${line}

    cd $repo_dir
    if [ $? -ne 0 ]; then
        echo "Can't enter directory [$repo_dir]."
        continue
    fi

    echo "Repo: $line, git $@ ..."
    git "$@"
    echo
done < $project_file

