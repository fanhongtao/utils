#!/bin/sh
# set -x

. ../string.sh
. ./test_utils.sh

# -------------------------------

test_contains_true() {
    printf "\"$1\" contains \"$2\""
    assertTrue $(contains $1 $2)
}

test_contains_false() {
    printf "\"$1\" contains \"$2\""
    assertFalse $(contains $1 $2)
}

test_contains_false "" ""
test_contains_false "abcdef" ""
test_contains_true  "abcdef" "a"
test_contains_true  "abcdef" "b"
test_contains_true  "abcdef" "ab"
test_contains_true  "abcdef" "abc"
test_contains_true  "abcdef" "abcd"
test_contains_true  "abcdef" "abcde"
test_contains_true  "abcdef" "abcdef"
test_contains_false "abcdef" "abcdefg"
test_contains_false "abcdef" "xyz"

exit

#----------------------------------------
# One function for both `true` and `false`
test_contains() {
    printf "\"$2\" contains \"$3\""
    if $1; then
        assertTrue $(contains $2 $3)
    else
        assertFalse $(contains $2 $3)
	fi
}
test_contains true  "abcdef" ""
test_contains true  "abcdef" "a"
test_contains false  "abcdef" "x"
