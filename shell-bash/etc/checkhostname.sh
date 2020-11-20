#!/bin/bash

PING=
HOST=${1:-$(hostname)}

case $(uname -s) in
    SunOS)  PING="ping ${HOST}" ;;
    Linux)  PING="ping ${HOST}" ;;
    *)      return 1            ;;
esac

if [ $($PING >&1 | grep -ci "Unknown host") -eq 0 ]; then
    echo "0"
else
    echo "1"
fi
