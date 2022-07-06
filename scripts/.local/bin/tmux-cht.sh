#!/usr/bin/env bash
selected=`cat ~/.local/bin/tmux-cht-languages ~/.local/bin/tmux-cht-commands | fzf --reverse`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Query: " query
clear

if grep -qs "$selected" ~/.local/bin/tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    curl -s cht.sh/$selected/$query | less -R
else
    curl -s cht.sh/$selected~$query | less -R
fi
