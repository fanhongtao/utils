#!/bin/bash
# Add remote to existing local git repositories.
# Execute this script in the projects' base directory.

# check args
if [ $# -ne 3 ]; then
    echo "Usage: $0  project-list-file  repo-base-url  remote-name"
    echo "Example"
    echo "      $0  project.list   git@github.com/fanhongtao  origin"
    exit 1
fi

base_dir=`pwd`
repo_base_url=$2
remote_name=$3

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
done < $1

