#!/bin/bash

i=0

arr=()
for j in $(netstat -alnp | grep 127.0.0.1 | awk '{print $5}' | sed 's/127.0.0.1://g') ; do
	arr[$i]="$j"
	echo "$i = $j"
    let "i = $i + 1"
done
echo ${arr[1]}



len=${#arr[@]}
for (( n=0; n<$len; n++ ))
do
    curl https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.txt | grep -w $arr | awk '{print $1}' | head -n 1
    echo "port num is $arr"

done

