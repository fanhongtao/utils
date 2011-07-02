#!/bin/bash
# Init git repositories on the local.
# Execute this script in the projects' base directory.

# check args
if [ $# -ne 1 ]; then
    echo "Usage: $0  project-list-file"
    exit 1
fi

base_dir=`pwd`
project_file=$1

while read line
do
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

