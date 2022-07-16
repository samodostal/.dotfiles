export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"

source $ZSH/oh-my-zsh.sh

alias nf="clear && neofetch"
alias c="clear"
alias lg="lazygit"
alias ld="lazydocker"
# alias code="nvim -u ~/.config/nvim/code.lua"
# alias note="nvim -u ~/.config/nvim/note.lua"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH=$PATH:$HOME/.ghcup/bin/
