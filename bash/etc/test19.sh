#!/bin/bash
echo
while getopts :a:b:c: opt
do
    case "$opt" in
        a) echo "Found the -a option $OPTARG" ;;
        b) echo "Found the -b option, with value $OPTARG" ;;
        c) echo "Found the -c option, with value $OPTARG" ;;
        *) echo "Unknown option: $opt" ;;
    esac
done
