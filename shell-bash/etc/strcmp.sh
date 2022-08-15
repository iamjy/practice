#!/bin/bash

StrCmp() {
	if [ $# -ne 2 ]; then
		echo "Usage: strcmp string1 string2" 1>&2
		exit 1
	fi

	if [ "$1" = "$2" ]; then
		echo "0"
	else
		_TMP=$({ echo "$1"; echo "$2"; }|sort|sed -n '1p')

		if [ "$_TMP" = "$1" ]; then
			echo "-1"
		else
			echo "1"
		fi
	fi
}

case $(StrCmp "$1" "$2") in
	-1) echo "string1 is less than string2." ;;
	 0) echo "string1 is equal to string2." ;;
	 1) echo "string1 is greater than string2." ;;
	 *) echo "StrCmp failed" ;;
esac
