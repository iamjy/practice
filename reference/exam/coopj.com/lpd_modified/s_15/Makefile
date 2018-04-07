### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  userprogs

userprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic" \
		LDLIBS="-lrt -laio" \
	 lab1_aio_test lab1_posix_test

clean:
	rm -rf  lab1_aio_test lab1_posix_test 
