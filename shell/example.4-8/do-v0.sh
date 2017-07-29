#!/bin/bash

source ./env.sh

pushd() {
	dirname=$1
	DIR_STACK="$dirname ${DIR_STACK:-$PWD' '}"
	cd ${dirname:?"missing directory name!"}
	echo "$DIR_STACK"
}

popd() {
	DIR_STACK=${DIR_STACK#* }
	cd ${DIR_STACK%% *}
	ls
	echo "$PWD"
}

pushd /home
pushd /home/iamjy1005
pushd /home/iamjy1005/work
pushd /home/iamjy1005/work/lab

popd
popd
popd
