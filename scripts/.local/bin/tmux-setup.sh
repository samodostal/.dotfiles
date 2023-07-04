#!/bin/sh

# Creates sessions and layouts on startup, is called from .zshrc
# (check if the session being created doesn't already exist)

# DOTFILES
tmux has-session -t dotfiles 2>/dev/null
if [ $? -ne 0 ]; then
    tmux new-session -ds dotfiles -c ~/.dotfiles
    tmux send-keys -t dotfiles 'nvim ./nvim/.config/nvim/init.lua' 'C-m'
fi
# tmux new-session -ds $selected -c $full_path \; send-keys 'nvim ' ' && clear' 'C-m' \; rename-window 'vim' \; new-window \; rename-window 'run' \; send-keys 'cd ' $full_path ' && clear' 'C-m' \; new-window \; rename-window 'git' \; send-keys 'cd ' $full_path ' && clear' 'C-m' \; send-keys 'lazygit' 'C-m' \; select-window -t 1 \;

# NOTES
tmux has-session -t notes 2>/dev/null
if [ $? -ne 0 ]; then
    tmux new-session -ds notes -c ~/OneDrive
    tmux send-keys -t notes 'nvim' 'C-m'
fi

# GHCI
tmux has-session -t ghci 2>/dev/null
if [ $? -ne 0 ]; then
    tmux new-session -ds ghci
    tmux send-keys -t ghci 'ghci' 'C-m'
fi
