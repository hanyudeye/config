#!/usr/bin/env bash

files1=()
for i in *.sh; do
    [[ -f $i ]] && files1+=("$i")
done
range1=${#files1[@]}
# echo RANDOM
a="hello"
b="world"
c=$a$b
echo concat($a,$b)

