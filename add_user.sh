#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0  user-name"
    exit -1
fi

# create a user
useradd -g users -s /bin/bash -d /home/$1 -m  $1

# set the password
echo $1:$1 | chpasswd

