#!/bin/bash

function ShowHelp()
{
    echo "Show status of repositories that need to work with."
    echo "To show status of all repositories, execute git_all.sh command."
    echo "Note: Execute this script in the projects' base directory."
    echo
    echo "Usage: $0 [-h]"
    echo "Example:"
    echo "    $0            Show status of repositories that need to work with"
    echo "    $0  -h        Show this message"
    exit 1
}

# check args
script_path=${0%/*}
. $script_path/include.sh
CheckForHelp $@

base_dir=`pwd`
project_file=".project/project.list"

while read line
do
    repo_dir=${base_dir}/${line}

    cd $repo_dir
    if [ $? -ne 0 ]; then
        echo "Can't enter directory [$repo_dir]."
        continue
    fi

    # If the repository is clean, we'll get only two line:
    #   On branch master
    #   nothing to commit (working directory clean)
    count=`git status | wc -l`
    if [ $count -ne 2 ]; then
        echo "Repo: $line, git $@ ..."
        git status  # run again, so that we can get status text in color
        echo
    fi
done < $project_file

