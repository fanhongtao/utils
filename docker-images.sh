#!/bin/bash

version="1.0"

usage() {
	cmd=$(basename "$0")
	cat <<EOF
USAGE: $cmd [options]

[options]
    -d, --delete:     delete docker images that match
    -r, --repository: set regular expression for REPOSITORY
    -t, --tag:        set regular expression for TAG

Find all the images that match the 'REPOSITORY' and 'TAG'.
List the images, if there is no '-d' option, otherwise delete them.

Examples:
    $cmd                     # list all images
    $cmd -r alpine           # list images only when column 'REPOSITORY' contains string 'alpine'
    $cmd -r "a.*e"           # list images only when column 'REPOSITORY' matches regular expression 'a.*e'
    $cmd -t latest           # list images only when column 'TAG' contains string 'latest'
    $cmd -r al -t latest     # list images that match both column 'REPOSITORY' and 'TAG'
    $cmd -r al -t latest -d  # DELETE images that match
EOF
	exit 0
}

show_version() {
	cmd=$(basename "$0")
	echo "$cmd version $version  https://github.com/fanhongtao/utils"
}

matches() {
    result=`echo "$line" | awk -v repo=${repository:-} -v tags=${tags:-} '{print (match($1, repo) && match($2, tags))}'`
    [ $result = "1" ]
}


while [ $# -gt 0 ]; do
	case "$1" in
	-d | --delete)
		DELETE_IMAGES=yes
		;;
	-r | --repository)
		shift
		repository=$1
		;;
	-t | --tags)
		shift
		tags=$1
		;;
	-v | --version)
		show_version
		exit 0
		;;
	-h | -\? | --help | -* | *)
		usage
		;;
	esac
	shift
done

docker images | awk 'NR>1 {print $0}' | while read line; do
    if ! matches; then
        continue
    fi

    echo "$line"
    if [ "${DELETE_IMAGES:-}" = "yes" ]; then
        image_id=`echo "$line" | awk '{print $3}'`
        docker image rm $image_id
        echo
    fi
done
