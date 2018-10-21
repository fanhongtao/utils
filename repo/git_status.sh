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

function ShowStatus()
{
    echo "Repo: $line ..."
    git status  # run again, so that we can get status text in color
    echo
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

    status=`git status`
    # If the repository is clean but ahead of server, we'll get:
    #   On branch master
    #   Your branch is ahead of 'local/master' by 1 commit.
    #     (use "git push" to publish your local commits)
    #
    #   nothing to commit, working tree clean
    repo_ahead=`echo $status | grep "Your branch is ahead of" | wc -l`
    if [ $repo_ahead -eq 1 ]; then
       ShowStatus
       continue
    fi

    # If the repository is clean, we'll get:
    #   On branch master
    #   Your branch is up to date with 'local/master'.
    #
    #   nothing to commit, working tree clean
    repo_nothing=`echo $status | grep "nothing to commit" | wc -l`
    if [ $repo_nothing -ne 1 ]; then
        ShowStatus
        continue
    fi
done < $project_file

