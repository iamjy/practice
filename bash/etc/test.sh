#!/bin/bash

test_read_ifs () {
	FILE=/etc/passwd
	
	read -p "Enter a user name > " user_name

	file_info=$(grep "^$user_name:" $FILE)
	if [ -n "$file_info" ]; then
		IFS=":" read user pw uid gid name home shell <<< "$file_info"

		echo "User = '$user'"
		echo "UID = '$uid'"
		echo "GID = '$gid'"
		echo "Name = '$name'"
		echo "Home = '$home'"
		echo "Shell = '$shell'"
	else
		echo "No such user '$user_name'" >&2
		exit 1
	fi
}

test_read_secret () {
#	if read -t 10 -sp "Enter secret passphrase > " secret_pass; then
#		echo -e "\nSecret passphrase = '$secret_pass'"
#	else
#		echo -e "\nInput timed out" >&2
#		exit 1
#	fi
	return
}

test_read_single () {
# read-single: read multiple values into default variable

	#read -p "Enter one or more values > "
	
	echo "REPLY = '$REPLY'"
}

test_read_multiple () {
# read-multiple: read multiple values from keyboard

	echo -n "Enter one or more values"
	#read var1 var2

	echo "var1 is '$var1'"
	echo "var2 is '$var2'"
}

test_integer4 () {
# test-integer4: determine if an integer is within a
# 				 specified range of values.

	MIN_VAL=1
	MAX_VAL=100

	INT=1

	if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
		#if [[ !($INT -ge $MIN_VAL && $INT -le $MAX_VAL) ]]; then
		if [ ! \( $INT -ge $MIN_VAL -a $INT -le $MAX_VAL \) ]; then
			echo "$INT is outside $MIN_VAL to $MAX_VAL"
		else
			echo "$INT is in range"
		fi
	else
		echo "INT is not an integer." >&2
		exit 1
	fi
}

test_integer3 () {
# test-integer3: determine if an integer is within a
# 				 specified range of values.

	MIN_VAL=1
	MAX_VAL=100

	INT=500

	if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
		#if [[ INT -ge MIN_VAL && INT -le MAX_VAL ]]; then
		#if ((INT >= MIN_VAL && INT <= MAX_VAL)); then
		if [ $INT -ge $MIN_VAL -a $INT -le $MAX_VAL ]; then
			echo "$INT is within $MIN_VAL to $MAX_VAL"
		else
			echo "$INT is out of range"
		fi
	else
		echo "INT is not an integer." >&2
		exit 1
	fi
}

test_integer2a () {
# test-integer2a: evaluate the value of integer

	INT=-3
	
	if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
		if ((INT == 0)); then
			echo "INT is zero."
		else
			if ((INT < 0)); then
				echo "INT is negative."
			else
				echo "INT is positive."
			fi
			if (( ((INT % 2)) == 0)); then
				echo "INT is even."
			else
				echo "INT is odd."
			fi
		fi
	fi
}

test_integer2 () {
# test-integer2: evaluate the value of integer

	echo -n "Please enter an integer ->"
	#read int

	if [[ "$int" =~ ^-?[0-9]+$ ]]; then
		if [ -z "$int" ]; then
			echo "$int is empty!" >$2
			exit 1
		fi

		if [ $int -eq 0 ]; then
			echo "int is zero."
		else
			if [ $int -lt 0 ]; then
				echo "int is negative."
			else
				echo "int is positive."
			fi
			if [ $((int % 2)) -eq 0 ]; then
				echo "int is even."
			else
				echo "int is odd."
			fi
		fi
	fi
}

test_integer () {
# test-integer: evaluate the value of integer

	INT=-5
	
	if [ -z "$INT" ]; then
		echo "INT is empty!" >$2
		exit 1
	fi

	if [ $INT -eq 0 ]; then
		echo "INT is zero."
	else
		if [ $INT -lt 0 ]; then
			echo "INT is negative."
		else
			echo "INT is positive."
		fi
		if [ $((INT % 2)) -eq 0 ]; then
			echo "INT is even."
		else
			echo "INT is odd."
		fi
	fi
}

test_string () {
# test-string: evaluate the value of string

	ANSWER=yes

	if [ -z "$ANSWER" ]; then
		echo "There is no answer!" >&2
		exit 1
	fi

	if [ "$ANSWER" == "yes" ]; then
		echo "The answer is yes."
	elif [ "$ANSWER" == "no" ]; then
		echo "The answer is no."
	elif [ "$ANSWER" == "maybe" ]; then
		echo "The answer is maybe."
	else
		echo "There answer is unknown."
	fi
}

test_file () {
# test-file: evaluate the status of a file
	
	FILE=~/.bashrc

	if [ -e "$FILE" ]; then
		if [ -f "$FILE" ]; then
			echo "$FILE is a regular file."
		fi
		if [ -d "$FILE" ]; then
			echo "$FILE is a directory file."
		fi
		if [ -r "$FILE" ]; then
			echo "$FILE is a readable."
		fi
		if [ -w "$FILE" ]; then
			echo "$FILE is a writable."
		fi
		if [ -x "$FILE" ]; then
			echo "$FILE is excutable or searchable"
		fi
	else
		echo "$FILE does not exist"
		exit 1
	fi
}

test_file
test_string
test_integer
test_integer2
test_integer2a
test_integer3
test_integer4
test_read_multiple
test_read_single
test_read_secret
test_read_secret
test_read_ifs

exit
