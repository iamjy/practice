#!/bin/bash

#local-var: script to demonstrate local variables

g_foo=0 # global variable g_foo

func_t1 () {
	local foo	# variable foo local to func_t1

	foo=1
	echo "func_t1: foo = $foo"
	return
}

func_t2 () {
	local foo	# variable foo local to func_t2
	
	foo=2
	echo "func_t2: foo = $foo"
	return
}

echo "gloval: foo = $g_foo"
func_t1
echo "gloval: foo = $g_foo"
func_t2
echo "gloval: foo = $g_foo"
