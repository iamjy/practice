#!/bin/bash

func1() {
	echo "Trying to display a non-existent file"
	ls -l badfile
}

echo "testing the function:"
func1
echo "The exit status is: $?"
