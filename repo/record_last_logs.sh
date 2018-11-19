#!/bin/bash

function ShowHelp()
{
    echo "Record the last log of each repositories. Uses this before build a release version."
    echo "Note: Execute this script in the projects' base directory."
    echo
    echo "Usage: $0"
    exit 1
}

script_path=${0%/*}
. $script_path/include.sh
CheckForHelp $@

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

    echo "Repo:   $line"
    git log -n 1
    echo
done < $project_file

