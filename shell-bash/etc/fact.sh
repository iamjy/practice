#!/bin/bash

factorial=1
cnt=1
num=$1

while [ $cnt -le $num ]
do
	factorial=$[ $factorial * $cnt ]
	cnt=$[ $cnt + 1 ]
done

result=$(echo $factorial | sed '{:start s/\(.//; t start}')
echo "The result is $result"
