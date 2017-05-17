### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  userprogs threadprogs

userprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic" \
	 lab1_signal lab2_sigaction lab3_block

threadprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic -pthread" \
	 lab4_sigorder

clean:
	rm -rf  lab1_signal lab2_sigaction lab3_block  lab4_sigorder
