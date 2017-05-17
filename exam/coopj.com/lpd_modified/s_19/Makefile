### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  threadprogs

threadprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic -pthread" \
	 lab1_mutex lab1_mutex_exitwithlock lab2_sem lab3_cond lab4_prodcons

clean:
	rm -rf   lab1_mutex lab1_mutex_exitwithlock lab2_sem lab3_cond lab4_prodcons
