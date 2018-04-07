#!/bin/bash

# Programe to output a system information page

report_uptime() {
	cat <<- _EOF_
			<H2>System Uptime</H2>
			<PRE>$(uptime)</PRE>
			_EOF_
	return
}

report_disk_space () {
	cat <<- _EOF_
			<H2>System Disk Space</H2>
			<PRE>$(df -h)</PRE>
			_EOF_
	return
}

report_home_space2 () {
	if [[ $(id -u) -eq 0 ]]; then
		cat <<- _EOF_
				<H2>Home Space Utilization (All Users)</H2>
				<PRE>$(du -sh /home/*)</PRE>
				_EOF_
	else
		cat <<- _EOF_
				<H2>Home Space Utilization ($HOME)</H2>
				<PRE>$(du -sh $HOME)</PRE>
				_EOF_
	fi

	return
}

report_home_space () {
	cat <<- _EOF_
			<H2>System Home Space</H2>
			<PRE>$(du -h)</PRE>
			_EOF_
	return
}

TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME, by $USER"

cat << _EOF_
<HTML>
	<HEAD>
			<TITLE>$TITLE</TITLE>
	</HEAD>
	<BODY>
			<H1>$TITLE</H1>
			<P>$TIME_STAMP</P>
			$(report_uptime)
			$(report_disk_space)
			$(report_home_space)
			$(report_home_space2)
	</BODY>
</HTML>
_EOF_
