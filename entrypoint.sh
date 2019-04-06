#!/bin/sh
set -eu

if [ "$#" -ne 3 ]; then
  exit 1
fi

if [ -s $GITHUB_EVENT_PATH ]; then
  : # nop
else
  echo "file not exists or empty file"
  exit 1
fi

VAR1=$(cat $GITHUB_EVENT_PATH | jq -r ".$1")
VAR2=$3

case $2 in
  "eq") eq $VAR1 $VAR2 ;;
  "ne") ne $VAR1 $VAR2 ;;
  "gt") gt $VAR1 $VAR2 ;;
  "ge") le $VAR1 $VAR2 ;;
  "lt") lt $VAR1 $VAR2 ;;
  "le") le $VAR1 $VAR2 ;;
  "gr") gr $VAR1 $VAR2 ;;
  *) exit 78 ;;
esac
