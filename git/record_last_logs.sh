#!/bin/bash
# Record the last log of each repositories. Uses this before build a release version.
# Execute this script in the projects' base directory.

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

    git log -n 1
done < $project_file

