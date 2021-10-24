#!/usr/bin/env bash
selected=`cat ~/.tmux-edit-files | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

if grep -qs "$selected" ~/.tmux-edit-files; then
    tmux neww bash -c "nvim $selected"
fi
