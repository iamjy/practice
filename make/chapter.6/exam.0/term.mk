#!/bin/bash

#.SILENT :

all: main.o lib.o
	gcc -o a.out main.o lib.o

iomod:
	echo "This is term.mk!"
	sleep 3
