#!/bin/bash

exec 2> error

echo "This is the start of the script"
echo "Now redirecting all output to another location"

exec 1> log

echo "This output should go to the testout file"
echo "BUT this should go to the error file" >& 2
