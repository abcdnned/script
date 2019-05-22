#!/bin/bash
tmp=${1#*java/}
p=$(echo ${tmp//\//.})
p=${p%.}
p=$(echo package $p\;)
echo $p
ls $1/*.java | xargs sed -i "1 c $p"

