#!/bin/bash

inputfile=$1

if [ -e ${inputfile} ] && \
   [ \( -f ${inputfile} \) -a \
     \( -x ${inputfile} \) ]; then
    echo "is a file"
fi

if [ 2 -ne 3  ]; then
    echo "!"
fi
