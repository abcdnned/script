#!/bin/bash
mvn clean install -Pdist && mvn -f /home/tom/gitrepo/dcd/pom.xml clean install -Pdist -Ddp.version=4.1.12-SNAPSHOT -o
