set fish_greeting

alias f="vifm"
alias v="nvim"
alias vim="nvim"
alias c="clear"
alias d="docker"
alias ds="docker-compose"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias git-clean="git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d"
alias JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-16.0.2.jdk/Contents/Home/"
# alias chrome-debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias chrome-debug="/Applications/Chromium.app/Contents/MacOS/Chromium --remote-debugging-port=9222"

if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

if status is-interactive
and not set -q TMUX
    exec tmux new-session -A -s main
end

fish_add_path /opt/homebrew/opt/mongodb-community@4.2/bin
