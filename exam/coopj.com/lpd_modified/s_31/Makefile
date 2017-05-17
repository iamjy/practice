### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  userprogs threadprogs

userprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic" \
		LDLIBS="-lrt" \
	 lab1_v_sem lab2_p_sem_shm lab2_v_sem_shm

threadprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic -pthread" \
		LDLIBS="-lrt" \
	 lab1_p_sem

clean:
	rm -rf  lab1_v_sem lab2_p_sem_shm lab2_v_sem_shm  lab1_p_sem
