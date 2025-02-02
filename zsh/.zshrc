# ZSH config
export ZSH=/usr/share/oh-my-zsh
export ZSH_THEME=robbyrussell
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Dark theme
GTK_THEME=Adwaita:dark
GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
QT_STYLE_OVERRIDE=Adwaita-Dark

# Aliases
alias nf="clear && neofetch"
alias copy="wl-copy"

# PATH
export USER_SCRIPTS=$HOME/.dotfiles/scripts/.config/scripts
export CARGO=$HOME/.cargo/bin
export PYENV=$HOME/.pyenv/bin

export PATH=$USER_SCRIPTS:$CARGO:$PYENV:$PATH

# External
source /usr/share/nvm/init-nvm.sh
eval "$(pyenv init - zsh)"
