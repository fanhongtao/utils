#!/bin/sh
# set -x

. ../string.sh
. ./test_utils.sh

# -------------------------------

test_endswith_true() {
    printf "\"$1\" endswith \"$2\""
    assertTrue $(endswith $1 $2)
}

test_endswith_false() {
    printf "\"$1\" endswith \"$2\""
    assertFalse $(endswith $1 $2)
}

test_endswith_false "abcdef" ""
test_endswith_true  "abcdef" "f"
test_endswith_true  "abcdef" "ef"
test_endswith_true  "abcdef" "def"
test_endswith_true  "abcdef" "cdef"
test_endswith_true  "abcdef" "bcdef"
test_endswith_true  "abcdef" "abcdef"
test_endswith_false "abcdef" "abcdefg"
