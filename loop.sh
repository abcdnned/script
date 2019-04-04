#!/bin/bash
DIR="/home/tom/tmp/pcap_cache"
FILE="NORMAL_PROTOCOL"
i=0
while true
do
    if [ "$(ls -A $DIR)" ]; then
        echo "not empty"
    else
        cp /home/tom/gitrepo/dcd-pcap/"$FILE".pcap /home/tom/tmp/pcap_cache/"$FILE$i".pcap
    fi
    sleep 0.01
    echo $i
    i=$((i + 1))
    n=$(find /home/tom/tmp/monitor_output -maxdepth 1 -type f -printf . | wc -c)
    echo $n
    if [ "$n" -gt 10 ]
    then
        ls -dt /home/tom/tmp/monitor_output/*.pcap | tail -n 8 | xargs rm
    fi
done
