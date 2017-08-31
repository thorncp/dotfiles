export TERM=xterm-256color

export VISUAL=vim
export EDITOR=$VISUAL
export DIFF=colordiff
export GOPATH=$HOME/go
export FZF_DEFAULT_COMMAND='ag -g ""'
export LESS="--RAW-CONTROL-CHARS --no-init --quit-if-one-screen"

# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"
PATH=$PATH:$GOPATH/bin

export -U PATH
