#!/bin/sh
if test ! -f "$1"
then
 echo "Error: executable $1 does not exist."
 exit 1
fi
if test ! -f "$2"
then
 echo "Error: trace log $2 does not exist."
 exit 1
fi
EXECUTABLE="$1"
TRACELOG="$2"
while read LINETYPE FADDR CADDR CTIME; do
 FNAME="$(addr2line -f -e ${EXECUTABLE} ${FADDR}|head -1)"
 CDATE="${CTIME}"
#CDATE="$(date -Iseconds -d @${CTIME})"
 if test "${LINETYPE}" = "e"
 then
 CNAME="$(addr2line -f -e ${EXECUTABLE} ${CADDR}|head -1)"
 CLINE="$(addr2line -s -e ${EXECUTABLE} ${CADDR})"
 echo "-> ${FNAME} <-- call -- ${CNAME}"
#echo "Enter ${FNAME} at ${CDATE}, called from ${CNAME} (${CLINE})"
 fi
 if test "${LINETYPE}" = "x"
 then
  if test "${FNAME}" != "??"
  then
  echo "<-  ${FNAME}  ${CDATE}"
  fi
 fi
done < "${TRACELOG}"
