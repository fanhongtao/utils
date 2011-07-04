#!/bin/bash

function ShowHelp()
{
    echo "Create git repositories on the server."
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
    echo $line
    repo_dir=${base_dir}/${line}.git

    if [ -d $repo_dir ]; then
        echo "Repository [$repo_dir] already exist."
        continue
    fi

    mkdir -p $repo_dir
    cd $repo_dir
    git init --bare
    cd ..
    chown -R git:users $repo_dir
done < $project_file

