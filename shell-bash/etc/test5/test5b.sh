#!/bin/bash

function dbl {
	read -p "Enter a value: " value
	echo $[ $value * 2 ]
}

result=$(dbl)
echo "The new value is $result"
