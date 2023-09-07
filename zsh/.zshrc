export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"

source $ZSH/oh-my-zsh.sh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

alias nf="clear && neofetch --size 315px --colors 4 12 4 4 12 7 --kitty ~/Wallpapers/arch.png"
alias c="clear"
alias lg="lazygit"
alias ld="lazydocker"
alias nvim="nvim --listen /tmp/nvim-server-$(tmux display-message -p '#S').pipe"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

[ -f "/home/samodostal/.ghcup/env" ] && source "/home/samodostal/.ghcup/env"

# PATH

export DENO_INSTALL="/home/samodostal/.deno/bin"
export GHCUP_INSTALL="/home/samodostal/.ghcup/bin"
export CABAL_INSTALL="/home/samodostal/.cabal/bin"
export GO_INSTALL="/home/samodostal/go/bin"
export DOTNET_INSTALL="/home/samodostal/.dotnet/tools"

export USER_SCRIPTS="/home/samodostal/.local/scripts"

export PATH=$PATH:$DENO_INSTALL:$GHCUP_INSTALL:$CABAL_INSTALL:$GO_INSTALL:$DOTNET_INSTALL:$USER_SCRIPTS

# TMUX SETUP

tmux-setup.sh
