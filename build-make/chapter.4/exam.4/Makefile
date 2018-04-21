#!/bin/bash

rm -f disp trac plot
make -k disp trac plot

stat=0
for executable in disp trac plot
do
	if
		test ! -x $executable
	then
		echo "$executable did not build correctly"
		stat = expr $stat + 1
	fi
done

exit $stat
