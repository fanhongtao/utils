#!/bin/sh

red="\033[31m"
green="\033[32m"
reset="\033[0m"

assertEqual() {
    if [ "x$1" = "x$2" ]; then
        echo ${green}" equal. \"$1\" == \"$2\""${reset}
    else
        echo ${red}" NOT equal. \"$1\" != \"$2\""${reset}
    fi
}

assertNotEqual() {
    if [ "x$1" != "x$2" ]; then
        echo ${green}" not equal. \"$1\" != \"$2\""${reset}
    else
        echo ${red}" equal. \"$1\" == \"$2\""${reset}
    fi
}


assertTrue() {
    if ($1); then
        echo ${green}" is True."${reset}
    else
        echo ${red}" is False."${reset}
    fi
}

assertFalse() {
    if ! $1; then
        echo ${green}" is False."${reset}
    else
        echo ${red}" is True."${reset}
    fi
}

# assertTrue "[ 1 -eq 1 ]"
# assertTrue "[ 1 -ne 1 ]"
