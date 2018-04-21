#!/bin/bash

counter=0

while [ -n "$1" ]
do
	case $1 in
		-a) echo "Found a option" ;;
		-b) param="$2"
				echo "param is $2"
				shift ;;
		-c) echo "Found c option" ;;
		--) shift
				break ;;
		*) echo "No option" ;;
	esac
	shift
done
