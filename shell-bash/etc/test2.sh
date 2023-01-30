#!/bin/bash

FILENAME=${1:?"filename missing.."}
HOWMANY=$2

sort -nr ${FILENAME} | head -${HOWMANY:-10}
