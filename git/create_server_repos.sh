#!/bin/bash
# Create git repositories on the server.
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

