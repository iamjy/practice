#!/bin/bash

function dbl {
	read -p "Enter a value: " value
	echo "doubling the value"
	return $[ $value * 2 ]
}

dbl
echo "The new value is $?"
