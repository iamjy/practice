### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  userprogs

userprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic" \
	 lab1_unix_udp_client lab1_unix_udp_server lab2_inet_udp_client lab2_inet_udp_server

clean:
	rm -rf  lab1_unix_udp_client lab1_unix_udp_server lab2_inet_udp_client lab2_inet_udp_server 
