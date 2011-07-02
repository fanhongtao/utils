#!/bin/bash
# Push git repositories to the server.
# Execute this script in the projects' base directory.

# check args
if [ $# -ne 1 -a $# -ne 2 ]; then
    echo "Usage: $0  remote-name  [ branch-name ]"
    echo "Example"
    echo "      $0  origin"
    echo "      $0  origin  master"
    exit 1
fi

base_dir=`pwd`
project_file=".project/project.list"
remote_name=$1
if [ $# -eq 2 ]; then
    branch_name=$2
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
done < $project_file

