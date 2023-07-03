#!/bin/sh

# Creates sessions and layouts on startup, is called from .zshrc
# (check if the session being created doesn't already exist)

# DOTFILES
tmux has-session -t dotfiles 2>/dev/null
if [ $? -ne 0 ]; then
    tmux new-session -s dotfiles -d -c ~/.dotfiles nvim ./nvim/.config/nvim/init.lua
fi

# NOTES
tmux has-session -t notes 2>/dev/null
if [ $? -ne 0 ]; then
    tmux new-session -s notes -c ~/OneDrive -d nvim
fi

# GHCI
tmux has-session -t ghci 2>/dev/null
if [ $? -ne 0 ]; then
    tmux new-session -s ghci -d ghci
fi
