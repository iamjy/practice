#!/bin/bash

addem() {
	if [ $# -eq 0 ] || [ $# -gt 2 ]; then
		echo -1
	elif [ $# -eq 1 ]; then
		echo $[ $1 + $1 ]
	else
		echo $[ $1 + $2 ]
	fi
}

echo -n "Adding 10 and 15: "
value=$(addem 10 15)
echo $value
value=$(addem 9)
echo $value
value=$(addem)
echo $value
value=$(addem 1 2 3)
echo $value
