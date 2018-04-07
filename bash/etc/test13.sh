exec 0< testfile
count=1

while read line
do
	echo "Line #$count: $line"
	cout=$[ $cout + 1 ]
done
