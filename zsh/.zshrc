export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"

source $ZSH/oh-my-zsh.sh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

alias nf="clear && neofetch"
alias c="clear"
alias lg="lazygit"
alias ld="lazydocker"
alias nvim="nvim --listen /tmp/nvim-server-$(tmux display-message -p '#S').pipe"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH=$PATH:$HOME/.ghcup/bin/

[ -f "/home/samodostal/.ghcup/env" ] && source "/home/samodostal/.ghcup/env"
