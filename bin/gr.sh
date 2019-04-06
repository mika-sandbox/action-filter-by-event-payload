#!/bin/sh
set -eu

echo $1 | grep $2 > /dev/null

if [ $? = 0 ]; then
  exit 0
else
  exit 78
fi