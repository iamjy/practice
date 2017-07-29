#!/bin/bash

if [ "$(hostname)" != "iamjy1005-desktop" ]
then
    echo "This hostname is $(hostname)"
else
    echo "..."
fi

do_print() {
    echo "This hostname is $(hostname)"
}

case "$(hostname)" in
    iamjy1005-desktop)
    do_print
    ;;
esac

