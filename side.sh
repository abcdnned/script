#!/bin/bash
ROOT="/home/tom/gitrepo/script/tmp"
tmux kill-session -t test 
tmux new-session -d -s test
tmux split-window -d -t test:0 -p20 -h
tmux select-layout -t test:0 even-horizontal
tmux attach-session -t test
