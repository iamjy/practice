#!/bin/bash

IsNewer() {
	if [ "$#" -ne 2 ]; then
		echo "Usage: IsNewer file1 file2" 1>&2
		exit 1
	fi

	if [ ! -f $1 -o ! -f $2 ]; then
		return 1	# No
	fi

	if [ -n "$(find $1 -newer $2 -print)" ]; then
		return 0	# Yes
	else
		return 1	# No
	fi
}

ARG0=$1
ARG1=$2

if IsNewer "$ARG0" "$ARG1"; then
	echo "Yes; $ARG0 is newer than $ARG1"
fi
