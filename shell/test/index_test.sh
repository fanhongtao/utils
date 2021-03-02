#!/bin/sh
# set -x

. ../string.sh
. ./test_utils.sh

# -------------------------------

test_index() {
    printf "index \"$1\" \"$2\" = $3, "
    assertEqual `index $1 $2` $3
}


test_index "abcde" "ab" 1
test_index "abcde" "cd" 3
test_index "abcde" "x" 0
