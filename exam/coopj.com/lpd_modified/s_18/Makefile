### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  threadprogs

threadprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic -pthread" \
	 lab1_counter lab2_signal lab3_sighandler lab4_constdest

clean:
	rm -rf   lab1_counter lab2_signal lab3_sighandler lab4_constdest
