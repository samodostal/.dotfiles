# ZSH config
export ZSH=/usr/share/oh-my-zsh
export ZSH_THEME=robbyrussell
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Options
unsetopt share_history

# Aliases
alias nf="clear && neofetch"
alias copy="wl-copy"

# PATH
export USER_SCRIPTS=$HOME/.dotfiles/scripts/.config/shell_scripts
export CARGO=$HOME/.cargo/bin
export GHCUP=$HOME/.ghcup/bin
export CABAL=$HOME/.cabal/bin
export LD_LIBRARY_PATH=""

export PATH=$USER_SCRIPTS:$CARGO:$GHCUP:$CABAL:$PATH

# External
source /usr/share/nvm/init-nvm.sh
