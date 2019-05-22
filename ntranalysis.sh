#!/bin/bash
awk '
{
for(i = 1; i <= NF; i++) {
    if ($i ~ /=/) {
        split($i, a, "=")
        if (a[1] in map) {
        } else {
            b++
        }
        map[a[1]]++
    }
}
}
END {
    print "#summary",FILENAME,b
    for (i in map) {
        print "#fld",i,map[i]
    }
}
' $1

