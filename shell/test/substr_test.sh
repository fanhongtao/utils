#!/bin/sh
# set -x

. ../string.sh
. ./test_utils.sh

# -------------------------------

test_start() {
    start=$1
    printf "$var[$start:] ... "
    presult=`python3 -c "print(\"$var\"[$start:])"`
    sresult=`substr $var $start`
    assertEqual $presult $sresult
}

test_start_stop() {
    start=$1
    stop=$2
    printf "$var[$start:$stop] ... "
    presult=`python3 -c "print(\"$var\"[$start:$stop])"`
    sresult=`substr $var $start $stop`
    assertEqual  $presult $sresult
}

# -------------------

var="abcdef"
len=${#var}


test_start      # test case for: start is not set

# for ((i=1; i<7; i++)); do
for i in `seq 0 $len`; do
    test_start $i
done
test_start 100

for i in `seq -1 -1 -$len`; do
    test_start $i
done
test_start -100

for i in `seq 0 $len`; do
    for j in `seq 0 $len`; do
        test_start_stop $i $j
    done
done

for i in `seq -1 -1 -$len`; do
    for j in `seq -1 -1 -$len`; do
        test_start_stop $i $j
    done
done
