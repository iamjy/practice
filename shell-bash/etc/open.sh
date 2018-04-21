#!/bin/bash

open () {
	touch $1
	chmod +x $1
}

if [ ! -e ./$1 ]; then
	open $1

	if [ ! -x ./$1 ]; then
		chmod u+x ./$1
	fi

	if [ -w ./$1 ]; then
		vim $1
	else
		echo "The file $1 is no write permission!"
		return 1
	fi
else
	echo "The file $1 is aleady exist!"
fi
