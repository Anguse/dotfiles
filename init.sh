#!/usr/bin/env bash


export ProjectRoot=$(pwd)
export BashMatic="${HOME}/.bashmatic"

[[ -s ${BashMatic}/init.sh ]] || {
  rm -rf "${BashMatic}" 2>/dev/null
  git clone https://github.com/kigster/bashmatic "${BashMatic}" 2>&1 1>/dev/null
}

source "${BashMatic}/init.sh"

info_msg() {
    warning "This script will create a symlink in ~/.vimrc, ~/.vim/init/ and ~/.tmux.conf."
    run.ui.ask "Continue?"
}

link.vim() {
    run "ln -s ${ProjectRoot}/.vimrc ~/.vimrc"
    run "ln -s ${ProjectRoot}/.vim/init ~/.vim/init"
}

link.tmux() {
    run "ln -s ${ProjectRoot}/.tmux.conf ~/.tmux.conf"
}

main() {
    info_msg
    link.vim
    link.tmux
}

(( $_s_ )) || main
