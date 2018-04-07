#!/bin/bash

testuser=iamjy1009

if grep ${testuser} /etc/passwd
then
	echo "This is my first command"
	echo "This is my second command"
	echo "I can even put in other commands besides echo:"
else
	echo "The user ${testuser} does not exist on this system"
	echo
fi

