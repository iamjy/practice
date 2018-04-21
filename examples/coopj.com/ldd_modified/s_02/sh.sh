#!/bin/bash

make
sudo insmod $1
sudo rmmod $1
dmesg
