#!/bin/bash

: <<'END'
function func1() {
  echo "This is an example of a function1"
}

function func2 {
  echo "This is an example of a function2"
}

func3() {
  echo "This is an example of a function3"
}

count=1
while [ $count -le 5 ]
do
  func1
  count=$[ $count + 1 ]
done

echo "This is the end of the loop"
func2
func3
echo "Now this is the end of the script"
END

: <<'END'
function check_file() {
  echo "Trying to display a non-existent file"
  ls -l badfile
}

function check_file2() {
  ls -l badfile
  echo "Trying to display a non-existent file"
}

check_file
echo "The check_file result is $?"

check_file2
echo "The check_file2 result is $?"
END

: <<'END'
function func_return() {
  read -p "Enter a value : " value
  return $[ $value + 10 ]
}

func_return
echo "The func_return result is $?"
END

: <<'END'
function func_return_over_255() {
  read -p "Enter a value : " value
  echo $[ $value + 255 ]
}

result=$(func_return_over_255)
echo "The func_return_over_255 result is $result"
END

: <<'END'
function func_array() {
  echo "The parameters are $@"
  thisarray=$1
  echo "The received array is ${thisarray[*]}"
}

array=(1 2 3 4 5)
echo The original array is ${array[*]}
func_array $array
END

function func_array1() {
  local sum=0
  local newarray
  newarray=($(echo "$@"))
  echo "The new array value is ${newarray[*]}"
}

array=(1 2 3 4 5)
func_array1 ${array[*]}
