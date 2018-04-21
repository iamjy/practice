#!/bin/bash

echo
while [ -n "$1" ]
do
	case "$1" in
	-a) echo "-a" ;;
	-b) param="$2"
		echo "Fount the -b option, with parameter value $param"
		shift ;;
	-c) echo "-c" ;;
	--) shift
		break ;;
	 *) echo "$1 is not an option" ;;
	esac
	shift
done

count=1
for param in $@
do
	echo "Parameter #$count: $param"
	count=$[ $count + 1 ]
done
