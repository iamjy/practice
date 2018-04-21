project (macro)
cmake_minimum_required (VERSION 2.6)

macro (my_macro arg1 arg2 arg3)
	message ("THe my_macro macro was passed the following arguments:")
	message ("${arg1}, ${arg2} and ${arg3}")
endmacro (my_macro)

my_macro (1 2 3)
my_macro (france germany russia)
