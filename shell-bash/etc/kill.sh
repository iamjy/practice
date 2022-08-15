#!/bin/bash
#
# NAME
#
#
# SYNOPSYS
#
#
# DESCRIPTION
#
#
# RETURN VALUE
#
#
###############################################################################
PATH=$PATH:"$(dirname $0)"

. systemtype.sh
. getyesno.sh

CMDNAME=$(basename $0)
USAGE="Usage: $CMDNAME [-signal] ProcessName"
OLD_IFS=$IFS
SIGNAL=
NAME=
PID=
PROCNAME=
OWNER=
PS_OPTS=
PROCESS_LIST=/tmp/list.$$
TITLE_PRINTED=FALSE
FOUND=FALSE
LINE=
COL=
SYSTEM=$(SystemType)

#
# 명령 줄로부터 인자 전달 받은 후 검사
# 
case $1 in
    --) shift ;;
    -*) SIGNAL=$1
        shift
        ;;
esac

if [ $# -ne 1 ]; then
    echo "$USAGE" 1>&2
    exit 1
fi

NAME=$1

#
# ps 명령에 사용할 옵션 선택
#
case $SYSTEM in
    x86_64) PS_OPTS="-auxw" ;;
    *)      PS_OPTS="-ef" ;;
esac

ps $PS_OPTS         |
    sed '1d'        |
    grep "$NAME"    |
    grep -v "$0"    |
    grep -v "ps $PS_OPTS" > $PROCESS_LIST

#
# 각 프로세스 검사
#
exec < $PROCESS_LIST
IFS=
while read LINE
do
    IFS=$OLD_IFS

    #
    #
    #
    set $LINE
    OWNER=$1
    PID=$2

    #
    #
    #
    case $SYSTEM in
        x86_64) COL=68 ;;
        *)      "Unexpected system type." 1>&2
                exit 1
                ;;
    esac

    LINE=$(echo "$LINE" | cut -c$COL-)
    set dummy $LINE
    shift
    PROCNAME=$1

    if [ "$PROCNAME" = "$NAME" -o \
         "$(basename $PROCNAME)" = "$NAME" ]; then

         FOUND=TRUE

        #
        #
        #
        if [ "$TITLE_PRINTED" = "FALSE" ]; then
            echo "PID owner process"
            TITLE_PRINTED=TRUE
        fi

        #
        #
        #
        if GetYesNo \
            "$PID $OWNER $PROCNAME (y/n)?" </dev/tty
        then
            kill $SIGNAL $PID
        fi
    fi

    IFS=
    
done

if [ "$FOUND" = "FALSE" ]; then
    echo "Process \"$NAME\" no found."
fi

rm -f /tmp/*.$$
exit 0
