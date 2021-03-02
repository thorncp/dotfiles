set fish_greeting ""
set fish_features qmark-noglob

set -x BAT_THEME OneHalfLight
set -x DIFF colordiff
set -x EDITOR vim
set -x FZF_DEFAULT_COMMAND 'ag --hidden -g ""'
set -x FZF_DEFAULT_OPTS '--color light'
set -x GOPATH $HOME/go
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x LESS "--RAW-CONTROL-CHARS --no-init --quit-if-one-screen"
set -x PIPENV_DONT_LOAD_ENV 1
set -x SHELL (which fish)
set -x VISUAL vim

fish_add_path $GOPATH/bin
fish_add_path $HOME/.asdf/bin
fish_add_path $HOME/.asdf/shims
fish_add_path $HOME/.bin
fish_add_path $HOME/.fzf/bin
fish_add_path .git/safe/../../bin
fish_add_path /usr/local/sbin

abbr --add g git
abbr --add v $VISUAL
abbr --add pm "pipenv run python manage.py"

alias ag "ag --pager less --color-line-number '1;34'"
