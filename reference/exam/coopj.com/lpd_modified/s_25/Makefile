### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, Axian Inc, 2/2003 - 11/2009 ####
### License: GPLv2 ###

allofit:  userprogs

userprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic" \
	 lab1_inet_stream_c lab1_inet_stream_s lab1_unix_stream_c lab1_unix_stream_s lab2_inet_stream_sr_c lab2_inet_stream_sr_s lab3_inet_dgram_c lab3_inet_dgram_s lab3_unix_dgram_c lab3_unix_dgram_s lab4_sendfile_client lab4_sendfile_server lab5_socketpair

clean:
	rm -rf  lab1_inet_stream_c lab1_inet_stream_s lab1_unix_stream_c lab1_unix_stream_s lab2_inet_stream_sr_c lab2_inet_stream_sr_s lab3_inet_dgram_c lab3_inet_dgram_s lab3_unix_dgram_c lab3_unix_dgram_s lab4_sendfile_client lab4_sendfile_server lab5_socketpair 
