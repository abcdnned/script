#!/bin/sh
s=`git st`
n="$(echo $s | grep -oP 'DP-\d+' | head -1)"
m="$(echo $s | grep -oP '\w+\.java' | head -1)"
if [ "$#" -ne 1 ]; then
    git commit -m "$n modifie $m"
else
    git commit -m "$n $1"
fi
