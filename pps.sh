#!/bin/bash
DIR="/home/tom/tmp/pcap_cache"
FILE="NORMAL_PROTOCOL"
i=0
n=100
p=9000
while [ $i -le $n ]
do
    cp /home/tom/gitrepo/dcd-pcap/"$FILE".pcap /home/tom/tmp/pcap_cache/"$FILE$i".pcap
    i=$((i + 1))
done
j=0
while [ "$(ls -A $DIR)" ]
do
    sleep 0.001
    j=$((j + 1))
done
echo $((p * n / j))
delete.sh
