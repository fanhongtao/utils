#!/bin/sh

Download()
{
    url=$1
    name=`basename $url`
    if [ ! -f $name ]; then
       wget $url
    fi
}

Download "http://nlp.stanford.edu/software/stanford-corenlp-4.2.0.zip"

# unzip & compress it into .gz, because Docker ADD can't uncompress .zip file
unzip stanford-corenlp-4.2.0.zip
tar -czf stanford-corenlp-4.2.0.tar.gz  stanford-corenlp-4.2.0
rm -rf stanford-corenlp-4.2.0/
