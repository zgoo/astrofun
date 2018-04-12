#!/bin/sh
while read line; do
  date=`date +%Y-%m-%d_%H:%M:%S.%N`
  echo $date ":" $line;
done
