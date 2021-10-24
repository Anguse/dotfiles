#!/usr/bin/env bash
hosts=`grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //'`
host=`printf $hosts | fzf`
if [[ -z $host ]]; then
    exit 0
fi
# direction=`echo to-target | fzf`
# if [[ -z $directory ]]; then
#     exit 0
# fi
pwd | fzf
file=`fzf --header="Select file" | sed 's/\n//'`
if [[ -z $file ]]; then
    exit 0
fi
directory=`sshpass -f $SP_SSH_PASSWD ssh -t $host "cd / && fd --type directory --color never" | fzf --header="Select target directory"`
if [[ -z $directory ]]; then
    exit 0
fi
if [[ -z $selected ]]; then
    exit 0
fi

tmux neww bash -c "sshpass -f $SP_SSH_PASSWD scp $file $host:/$directory"
