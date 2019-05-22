#!/usr/bin/env bash
rm -f /home/tom/tmp/gc.log
#java -jar -XX:+UseG1GC -XX:+PrintGCDetails -XX:MaxGCPauseMillis=200 -XX:GCPauseIntervalMillis=1000 -Xloggc:/home/tom/tmp/gc.log -XX:+PrintAdaptiveSizePolicy -XX:+ParallelRefProcEnabled -XX:+PrintReferenceGC dp-engine.jar -c /home/tom/tmp/dpbench/config/ -m runtime -i monitor -o btr
java -jar -XX:+HeapDumpOnOutOfMemoryError -Xmx40m dp-engine.jar -c /home/tom/tmp/dpbench/config4/ -m runtime -i monitor -o btr
#export MAVEN_OPTS="-XX:+UseG1GC -XX:+PrintGCDetails -XX:+PrintFlagsFinal -Xloggc:/home/tom/tmp/gc.log -XX:+ParallelRefProcEnabled -XX:+PrintReferenceGC"
#export MAVEN_OPTS="-XX:+UseG1GC -XX:+PrintGCDetails"
#mvn test -Dtest=DpbenchHttpTest -Pregression -Dsurefire.useSystemClassLoader=false

