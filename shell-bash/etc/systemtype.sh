#!/bin/bash

SystemType() {
    _HOSTNAME=$(hostname | sed 's/\..*//')

    case $(uname -n) in
        AIX)            echo "AIX" ;;
        ${_HOSTNAME})   case $(uname -m) in
                            x86_64) echo "x86_64" ;;
                            *)      echo "Unknown machine!"
                        esac
                        ;;
        *) echo "Unknown system!" ;;
    esac

    return 1
}

#echo $(SystemType)
