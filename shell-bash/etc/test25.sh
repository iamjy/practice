IFS.OLD=$IFS
IFS=$'\n'

for entry in $(cat /etc/passwd)
do
	echo "Values in $endtry -"
	IFS=:
	for value in $entry
	do
		echo "	$value"
	done
done
