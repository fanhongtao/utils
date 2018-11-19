#!/bin/bash

function ShowHelp()
{
    echo "Init git repositories on the local."
    echo "Note: Execute this script in the projects' base directory."
    echo
    echo "Usage: $0  project-list-file"
    exit 1
}

# check args
script_path=${0%/*}
. $script_path/include.sh
CheckForHelp $@
if [ $# -ne 1 ]; then
    ShowHelp
fi

base_dir=`pwd`
project_file=$1

while read line
do
    line=`echo $line | sed 's/\r//'`  # Remove '\r' in dos-format
    # echo $line
    repo_dir=${base_dir}/${line}

    cd $repo_dir
    if [ $? -ne 0 ]; then
        echo "Can't enter directory [$repo_dir]."
        continue
    fi

    git init
    git add *
    if [ -f .gitignore ]; then
        git add .gitignore
    fi
    git commit -m "First commit"
done < $project_file

