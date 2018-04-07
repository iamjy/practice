#!/bin/bash

function func1 {
	echo "hi"
}

count=1
while [ $count -le 5 ]
do
	func1
	count=$[ $count + 1 ]
done
