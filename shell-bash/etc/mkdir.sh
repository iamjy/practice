#!/bin/bash

CMDNAME="$(basename $0)"

if [ $# -ne 1 ]; then
    echo "Usage: $CMDNAME directory" 1>&2
    exit 1
fi

case $1 in
    /*) DIR= ;;
    *)  DIR=. ;;
esac

IFS=/
for d in $1
do
    DIR="$DIR/$d"
    if [ ! -d "$DIR" ]; then
        mkdir "$DIR"
    fi
done
