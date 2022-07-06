#!/usr/bin/env bash

IFS=$'\n' read -d '' -r -a project_dirs < ~/.local/bin/tmux-project-dirs

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(
        for project_dir in "${project_dirs[@]}"; do
            ls -d $HOME/$project_dir | xargs -n 1
        done | cut -c 27- | fzf --reverse
    )
fi

if [[ -z $selected ]]; then
    exit 0
fi

if ! tmux has-session -t $selected 2> /dev/null; then
    prefix_path="$HOME/Projects/"
    full_path="${prefix_path}${selected}"
    tmux new-session -ds $selected -c $full_path \; send-keys 'nvim ' ' && clear' 'C-m' \; rename-window 'vim' \; new-window \; rename-window 'run' \; send-keys 'cd ' $full_path ' && clear' 'C-m' \; new-window \; rename-window 'git' \; send-keys 'cd ' $full_path ' && clear' 'C-m' \; send-keys 'lazygit' 'C-m' \; select-window -t 1 \;
fi

tmux switch-client -t $selected
