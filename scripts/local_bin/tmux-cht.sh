#!/usr/bin/env bash
selected=`cat /Users/samueldostal/local_bin/tmux-cht-languages /Users/samueldostal/local_bin/tmux-cht-command | fzf --reverse`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Query: " query
clear

if grep -qs "$selected" /Users/samueldostal/local_bin/tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    echo "Language: $selected, Query: $query" & echo & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done
else
    curl cht.sh/$selected~$query | less
fi
