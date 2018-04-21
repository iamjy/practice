#!/bin/bash

mypath=$(echo $PATH | sed 's/:/ /g')
count=1

for dir in $mypath
do
	check=$(ls $dir)
	for dir in $check
	do
		count=$[ $count + 1 ]
	done
	echo "$dir - $count"
	count=0
done

