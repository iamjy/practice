#!/bin/bash

PWD=${PWD}
FILE_PATH=${PWD}/${1}
FILE_NAME=${FILE_PATH##*/}

echo ${FILE_PATH}
echo ${FILE_PATH%/*}
echo ${FILE_NAME}
