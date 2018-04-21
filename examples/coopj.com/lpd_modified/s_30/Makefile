### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  userprogs

userprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic" \
		LDLIBS="-lrt" \
	 lab1_p_shm lab1_v_shm

clean:
	rm -rf  lab1_p_shm lab1_v_shm 
