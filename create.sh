#!/bin/bash
if [ ! -d "$1" ]; then
  mkdir -p "$1"
fi
cat <<EOF >$1/$2
$3
EOF
