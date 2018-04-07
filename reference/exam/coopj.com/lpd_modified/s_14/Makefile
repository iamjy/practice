### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  userprogs

userprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic" \
	 lab1_pchild_exec lab2_popen lab3_fifo lab4_splice

clean:
	rm -rf  lab1_pchild_exec lab2_popen lab3_fifo lab4_splice 
