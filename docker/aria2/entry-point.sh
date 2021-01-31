#!/bin/sh

mkdir -p /aria2/config
mkdir -p /aria2/download

cfg_file="/aria2/config/aria2.conf"
if [ ! -e $cfg_file ]; then
    cp /startup/aria2.conf $cfg_file
fi

session_file="/aria2/aria2.session"
if [ ! -e $session_file ]; then
    touch $session_file
fi

aria2c --conf $cfg_file
