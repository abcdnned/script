#!/bin/bash
rm -f ~/tmp/btrcomp1
rm -f ~/tmp/btrcomp2
sed -r 's/.*(PktId=[0-9]+).*/\1/g' $1 > ~/tmp/btrcomp1
sed -r 's/.*(PktId=[0-9]+).*/\1/g' $2 > ~/tmp/btrcomp2
diff ~/tmp/btrcomp1 ~/tmp/btrcomp2 > ~/tmp/btrcomp3
cat ~/tmp/btrcomp3
