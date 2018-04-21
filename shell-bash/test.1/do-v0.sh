#!/bin/bash

path=/home/cam/book/long.file.name

echo ${path#/*/}
echo ${path##/*/}
echo ${path}
echo ${path%.*}
echo ${path%%.*}
