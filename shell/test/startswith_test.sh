#!/bin/sh
# set -x

. ../string.sh
. ./test_utils.sh

# -------------------------------

test_startswith_true() {
    printf "\"$1\" startswith \"$2\""
    assertTrue $(startswith $1 $2)
}

test_startswith_false() {
    printf "\"$1\" startswith \"$2\""
    assertFalse $(startswith $1 $2)
}


test_startswith_false "abcdef" ""
test_startswith_true  "abcdef" "a"
test_startswith_true  "abcdef" "ab"
test_startswith_true  "abcdef" "abc"
test_startswith_true  "abcdef" "abcd"
test_startswith_true  "abcdef" "abcde"
test_startswith_true  "abcdef" "abcdef"
test_startswith_false "abcdef" "abcdefg"
test_startswith_false "abcdef" "bcd"
