#!/bin/bash

testuser=iamjy1005

if grep ${testuser} /etc/passwd
then
	echo "This is my first command"
	echo "This is my second command"
	echo "I can even put in other commands besides echo:"
fi

