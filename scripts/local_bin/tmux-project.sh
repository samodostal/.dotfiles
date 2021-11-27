#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(
        (
            ls -d ~/Projects/aoc/* | xargs -n 1
            ls -d ~/Projects/archive/resco/* | xargs -n 1
            ls -d ~/Projects/freelance/* | xargs -n 1
            ls -d ~/Projects/learning/udemy/* | xargs -n 1 
            ls -d ~/Projects/nvim_plugins/* | xargs -n 1 
            ls -d ~/Projects/smart_trial/* | xargs -n 1 
            ls -d ~/Projects/university/* | xargs -n 1 
            ls -d ~/Projects/university/eclipse/*| xargs -n 1 
            ls -d ~/Projects/termtick/cpp/ | xargs -n 1
        ) | cut -c 30- | fzf --reverse
    )
fi

if [[ -z $selected ]]; then
    exit 0
fi

if ! tmux has-session -t $selected 2> /dev/null; then
    prefix_path="$HOME/Projects/"
    full_path="${prefix_path}${selected}"
    tmux new-session -ds $selected -c $full_path \; send-keys 'nvim ' ' && clear' 'C-m' \; rename-window 'vim' \; new-window \; rename-window 'run' \; send-keys 'cd ' $full_path ' && clear' 'C-m' \; new-window \; rename-window 'vifm' \; send-keys 'cd ' $full_path ' && clear' 'C-m' \; send-keys 'vifm .' 'C-m' \; select-window -t 1 \;
fi

tmux switch-client -t $selected
