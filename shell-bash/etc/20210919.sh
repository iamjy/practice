#!/bin/bash

for var in $@
do
case $var in
    '$a') echo "a";;
    "b") echo "b";;
    *) echo "else";;
esac
done
