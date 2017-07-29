#!/bin/bash

fatal () {
    echo "$0: fatal error:" "$@" >&2
    exit 1
}

if [ $# = 0 ]
then
    fatal not enough arguments
fi

