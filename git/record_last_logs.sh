#!/bin/bash
# Record the last log of each repositories. Uses this before build a release version.
# Execute this script in the projects' base directory.

# check args
if [ $# -lt 1 ]; then
    echo "Usage: $0  project-list-file"
    echo "Example:"
    echo "    $0  project.list"
    exit 1
fi

base_dir=`pwd`

while read line
do
    repo_dir=${base_dir}/${line}

    cd $repo_dir
    if [ $? -ne 0 ]; then
        echo "Can't enter directory [$repo_dir]."
        continue
    fi

    git log -n 1
done < $1

