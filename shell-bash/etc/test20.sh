#!/bin/bash

echo
while getopts :ab:cd opt
do
    case "$opt" in
    a) echo "-a" ;;
    b) echo "-b $OPTARG" ;;
    c) echo "-c" ;;
    d) echo "-d" ;;
    *) echo "Unknown option: $opt" ;;
    esac
done

echo $OPTIND
shift $[ $OPTIND - 1 ]

count=1
for param in "$@"
do
	echo "Parameter $count: $param"
	count=$[ $count + 1]
done
