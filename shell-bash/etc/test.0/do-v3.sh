#!/bin/bash

FILENAME=${1}
FILENAME=${FILENAME:?"Filename missing!"}
HOWMANY=${2:-10}
sort -nr $FILENAME | head -${HOWMANY:-10}
