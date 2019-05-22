#!/bin/sh
if ! grep -q $1 $2; then
  echo $1
fi
