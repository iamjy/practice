#!/bin/bash

FILENAME=$1
HOWMANY=${2:-10}
sort -nr $FILENAME | head -${HOWMANY:-10}
