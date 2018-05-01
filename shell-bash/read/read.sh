#!/bin/bash

case $1 in
#: <<'END'
  1)
echo -n "Enter your name : "
read name
echo "Your name is $name"
echo "\tYour name is \n\r$name"
echo -e "\tYour name is \n\r$name" ;;
#END
  2)
#: <<'END'
read -p "Enter enter your age : " age
days=$[ $age * 365 ]
echo 'Thar makes you over $days days old!'
echo "Thar makes you over $days days old!"
echo -e '\tThar makes you over \n\"$days\" days old!'
echo -e "\tThar makes you over \n\"$days\" days old!"
printf $'Thar makes you over \'$days\' days old!\n'
printf $"Thar makes you over \'$days\' days old!\n" ;;
#END
  3)
#: <<'END'
read -p "Enter your name : " first last
echo 'Hello, $last $first.\tWelcom to my program!\nBye~'
echo "Hello, $last $first.\tWelcom to my program!\nBye~"
echo -e "Hello, $last $first.\tWelcom to my program!\nBye~" ;;
#END
  4)
#: <<'END'
read -p "Enter your name : "
echo -e "Hello, $REPLY.\tWelcom to my program!\nBye~ $REPLY" ;;
#END
  5)
#: <<'END'
if read -t 5 -p "Please Enter Your Name : " name
then
  echo 'Hello $name, welcom to my script!'
  echo "Hello $name, welcom to my script!"
  echo -e "Hello $name,\n\twelcom to my script!"
else
  echo "Sorry, too slow..."
fi ;;
#END
  6)
#: <<'END'
read -n1 -p "Do you want to continue [Y/n] : " answer
case $answer in
  Y | y)
    echo -e "\nFine, continue on" ;;
  N | n)
    echo -e "\nOk, goodbye" ;;
  *)
    echo -e "Do nothing"
    exit ;;
esac
echo This is end of the script ;;
#END
  7)
#: <<'END'
PASSWD="1q@2w#"
read -s -p "Enter your password : " passwd
if [ $passwd = $PASSWD ]; then
  echo -e "\nCorrect"
else
  echo -e "\nWrong"
  exit
fi
echo "Your password is $passwd" ;;
#END
  8)
#: <<'END'
count=1
cat test | while read line
do
  echo "Line $count : $line"
  count=$[ $count + 1 ]
done ;;
#END
*)
  echo "Do nothing"
  exit ;;
esac
