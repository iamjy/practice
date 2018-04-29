#!/bin/bash

: <<'END'
tempfile=$(mktemp temp.XXXXXX)

exec 3>$tempfile

echo "This script writes to the tempfile $tempfile"
echo "This is the first line" >&3
echo "This is the second line" >&3
echo "This is the third line" >&3

exec 3>&-

echo "Done creating file. The contants ar:"
cat $tempfile
rm -f $tempfile 2> /dev/null
END

: <<'END'
tempfile=$(mktemp -t temp.XXXXXX)

exec 3> tempfile

echo "This is a test file" >&3
echo "This is the second line of test" >&3
echo "The temp file is located at: $tempfile"

exec 3>&-

cat $tempfile
rm -f $tempfile
END

: <<'END'
tempdir=$(mktemp -t -d temp.XXXXXX)
cd $tempfile
tempfile1=$(mktemp $tempdir/temp.XXXXXX)
tempfile2=$(mktemp $tempdir/temp.XXXXXX)

exec 7> $tempfile1
exec 8> $tempfile2

echo "Sending data to directory $tempdir"
echo "This is a test line for data $tempfile1" >&7
echo "This is a test line for data $tempfile2" >&8
END

: <<'END'
outfile='members.sql'
IFS=','
while read lname fname address city state zip
do
  cat >> out << EOF INSERT INTO members ( lname,fname,address,city,state,zip ) VALUES ( '$lname', '$fname', '$address', '$city', '$state', '$zip' ); EOF
done
END
