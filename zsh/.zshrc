export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias nf="clear && neofetch"
alias c="clear"
alias code="nvim -u ~/.config/nvim/code.lua"
alias note="nvim -u ~/.config/nvim/note.lua"
