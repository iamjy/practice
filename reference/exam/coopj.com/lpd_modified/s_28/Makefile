### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  userprogs threadprogs

userprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic" \
	 lab1_epoll lab1_select lab2_client lab2_server_epoll lab2_server_fork lab2_server_poll lab2_server_select

threadprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic -pthread" \
	 lab2_server_pthread

clean:
	rm -rf  lab1_epoll lab1_select lab2_client lab2_server_epoll lab2_server_fork lab2_server_poll lab2_server_select  lab2_server_pthread
