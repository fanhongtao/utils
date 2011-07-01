#!/bin/bash
# Push git repositories to the server.
# Execute this script in the projects' base directory.

# check args
if [ $# -ne 2 -a $# -ne 3 ]; then
    echo "Usage: $0  project-list-file  remote-name  [ branch-name ]"
    echo "Example"
    echo "      $0  project.list  origin"
    echo "      $0  project.list  origin  master"
    exit 1
fi

base_dir=`pwd`
remote_name=$2
if [ $# -eq 3 ]; then
    branch_name=$3
else
    branch_name="master"
fi

while read line
do
    repo_dir=$base_dir/$line
    echo "Pushing $line ..."

    cd $repo_dir
    if [ $? -ne 0 ]; then
        echo "Can't enter directory [$repo_dir]."
        continue
    fi

    git push $remote_name  $branch_name
done < $1

