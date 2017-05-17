project (conditon)
cmake_minimum_required (VERSION 2.6)

set (my_var 1)

if (${my_var})
	message ("my_var is true")
else ()
	message ("my_var_is false")
endif ()

if (EXISTS README)
	message("README is exists")
else ()
	message("README doesn't exists")
endif ()
