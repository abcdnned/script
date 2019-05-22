#!/bin/bash
find -name *.pro | xargs sed -i '1 a -dontobfuscate'

