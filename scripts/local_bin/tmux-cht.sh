#!/usr/bin/env bash
selected=`cat /Users/samueldostal/local_bin/tmux-cht-languages /Users/samueldostal/local_bin/tmux-cht-command | fzf --reverse`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Query: " query
clear

if grep -qs "$selected" /Users/samueldostal/local_bin/tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    curl -s cht.sh/$selected/$query | less -R
else
    curl -s cht.sh/$selected~$query | less -R
fi
