#!/bin/bash

FIELDNAME=$1
FILENAME=${2:-"test.txt"}
cut -f$(getfield $FIELDNAME) -d\| $2
