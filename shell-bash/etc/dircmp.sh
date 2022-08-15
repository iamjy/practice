#!/bin/bash

#
# NAME
#
#
# SYNOPSIS
#
#
# DESCRIPTION
#
#
#
###############################################################################
CMDNAME=$(basename $0)
USAGE="Usage: $CMDNAME [-v] [dir1] dir2"

CURDIR=$(pwd)
DIR1=
DIR2=
DIR1_FILES=/tmp/files1.$$
DIR2_FILES=/tmp/files2.$$
ALL_FILES=/tmp/allfiles.$$
COMMON_FILES=/tmp/comfiles.$$
TMP=/tmp/tmp.$$
FOUND=FALSE
FIRST=
VERBOSE=FALSE

trap 'rm -f /tmp/*.$$; exit 1' 1 2 3 15

#
# 명령행 옵션 파싱
#
while :
do
    case $1 in
        -v) VERBOSE=TRUE
            shift
            ;;
        --) shift
            break
            ;;
        -*) echo "$USAGE" 1>&2
            exit 1
            ;;
         *) break ;;
    esac
done

#
# 명령 라인 매개변수 얻기
#
if [ $# -eq 1 ]; then
    DIR1="."
    DIR2="$1"
elif [ $# -eq 2 ]; then
    DIR1="$1"
    DIR2="$2"
else
    echo "$USAGE" 1>&2
fi

#
# 디렉토리 검사
#
if [ ! -d $DIR1  ]; then
    echo "$DIR1 is not a directory." 1>&2
    exit 2
fi

if [ ! -d $DIR2 ]; then
    echo "$DIR1 is not a directory." 1>&2
    exit 2
fi

#
# 비교할 파일 찾기
#
cd $DIR1
find . -type f,l -print | sort > $DIR1_FILES
cd $CURDIR

cd $DIR2
find . -type f,l -print | sort > $DIR2_FILES
cd $CURDIR

#
# 모든 파일 목록 생성
#
cat $DIR1_FILES $DIR2_FILES | sort | uniq > $ALL_FILES
cat $DIR1_FILES $DIR2_FILES | sort | uniq -d > $COMMON_FILES

#
# DIR1에는 없고 DIR2에만 존재하는 파일 출력
#
cat $DIR1_FILES $ALL_FILES | sort | uniq -u > $TMP
if [ -s $TMP ]; then
    FOUND=TRUE
    
    echo ""
    echo "Files missing from $DIR1:"
    
    for f in $(cat $TMP)
    do
        f=$(expr $f : '..\(.*\)')
        echo -e "\t$f"
    done
fi

#
# DIR2에는 없고 DIR1에만 존재하는 파일 출력
#
cat $DIR2_FILES $ALL_FILES | sort | uniq -u > $TMP
if [ -s $TMP ]; then
    FOUND=TRUE
    
    echo ""
    echo "Files missing from $DIR2:"

    for f in $(cat $TMP)
    do
        f=$(expr $f : '..\(.*\)')
        echo -e "\t$f"
    done
fi

#
# 동일하지 않은 DIR1과 DIR2의 파일 출력
#
FIRST=TRUE

for f in $(cat $COMMON_FILES)
do
    cmp -s $DIR1/$f $DIR2/$f
    if [ $? -ne 0 ]; then
        FOUND=TRUE
        f=$(expr $f : '..\(.*\)')

        if [ "$FIRST" = "TRUE" ]; then
            FIRST=FALSE
            echo ""
            echo "Files that are not the same"
        fi

        if [ "$VERBOSE" = "TRUE" ]; then
            echo ""
            echo "File: $f"
            diff $DIR1/$f $DIR2/$f
        else
            echo "  $f"
        fi
    fi
done

rm -f /tmp/*.$$
if [ $FOUND = TRUE ];then
    exit 2
else
    echo "The directories are the same."
    exit 0
fi

