#!/usr/bin/env bash

input_file=~/.local/bin/tmux-project-dirs

project=$(while IFS= read -r line; do
  if [[ "$line" =~ ^\s*# || -z "$line" ]]; then
    continue
  fi

  ls -d $HOME/$line | cut -c 27-
done < "$input_file" | fzf --reverse)

if [[ -z $project ]]; then
    exit 0
fi

project_path="$HOME/Projects/$project"
project_name=$(basename "$project_path" | tr '.' '-')

if tmux has-session -t $project_name 2>/dev/null; then
    tmux switch-client -t $project_name
else
    tmux new-session -ds $project_name -c $project_path
    tmux switch-client -t $project_name
fi
