#!/bin/bash

: <<'END'
echo "This is an error message" >&2
echo "This is normal message"
#$ ./redirect.sh 2> error_log
END

: <<'END'
exec 1> stdout_redirect_log

echo "This is test of all redirecting output"
echo "from a script to another file"
echo "without having to redirect every indivisual line"
END


: <<'END'
exec 2> stderr_redirect_log

echo "This is the start of the script"
echo "now redirecting all output to another location"

exec 1> stdout_redirect_log

echo "This output should go to the stdin_redirect_log file"
echo "But this should go to the stderr_redirect_log file" >&2
END

: <<'END'
exec 0< stdin_redirect_file

count=1
while read line
do
  echo "Line $count: $line"
  count=$[ $count + 1 ]
done
END

: <<'END'
exec 6<&0
exec 0<stdin_redirect_file

count=1
while read line
do
  echo "Line #$count: $line"
  count=$[ $count + 1 ]
done

exec 0<&6

read -p "Are you done [Y/n] " answer
case $answer in
  Y|y)
   echo "Done" ;;
  N|n)
   echo "Not done" ;;
  *)
   echo "Do nothing" ;;
esac
END

: <<'END'
exec 3<> testfile
read line <&3
echo "Read: $line"
echo "This is a test line" >&3
END

: <<'END'
exec 3> testfile
echo "This is a test line of data" >&3
exec 3>&-
echo "This won't work" >&3
END
