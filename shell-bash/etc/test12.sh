#!/bin/bash

location=$HOME
file_name="sentinel"

if [ -e $location ]; then
	echo "OK onthe $location directory"
	echo 'OK onthe $location directory'
	if [ -e $location/$file_name ]; then
		echo "OK on the filename"
		echo "Updating Current Date..."
		if [ -O $location/$file_name ]; then
			echo "This $file_name is own!"
			date >> $location/$file_name
		else
			echo "This $file_name no own!"
		fi
	else
		echo "File doest not exist"
		echo "Noting to update"
	fi
else
	echo "The $location directory does not exist."
	echo "Noting to update"
fi
