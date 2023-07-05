#!/bin/sh

# Creates sessions and layouts on startup, is called from .zshrc
# (check if the session being created doesn't already exist)

# DOTFILES
tmux has-session -t dotfiles 2>/dev/null
if [ $? -ne 0 ]; then
    tmux new-session -ds dotfiles -c ~/.dotfiles
    tmux send-keys -t dotfiles 'nvim ./nvim/.config/nvim/init.lua' 'C-m'
    tmux split-window -t dotfiles -c ~/.dotfiles -h -l 50
    tmux split-window -t dotfiles -c ~/.dotfiles -v
    tmux select-pane -t dotfiles -L
fi

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
    tmux send-keys -t ghci 'clear && ghci' 'C-m'
fi
