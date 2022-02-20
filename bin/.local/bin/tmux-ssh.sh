#!/usr/bin/env bash
hosts=`grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //'`

host=`printf "$hosts" | fzf | awk '{print $1}'` # pick first name
tmux neww bash -c "ssh $host"
