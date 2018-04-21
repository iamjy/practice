include include/version.mk

#HOST_NCPU = $(shell if [ -f /proc/cpuinfo ]; then n=`grep -c processor /proc/cpuinfo`; if [ $$n -gt 1 ];then expr $$n \* ${CPU_OVERLOAD}; else echo $$n; fi; else echo 1; fi)
string=$(shell sed -n "/version/p" a.a)

all:
	@echo $(string)
#	@echo ${HOST_NCPU}
