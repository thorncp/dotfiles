export TERM=xterm-256color

export VISUAL=nvim
export EDITOR=$VISUAL
export DIFF=colordiff
export GOPATH=$HOME/go
export FZF_DEFAULT_COMMAND='ag -g ""'

# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"
PATH=$PATH:$GOPATH/bin

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

export -U PATH

eval "$(rbenv init -)"
