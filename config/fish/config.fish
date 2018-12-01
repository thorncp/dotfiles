set fish_greeting ""

if test -d $HOME/.asdf
  source $HOME/.asdf/asdf.fish
end

set -x DIFF colordiff
set -x EDITOR vim
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x GOPATH $HOME/go
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_UPGRADE_CLEANUP 1
set -x LESS "--RAW-CONTROL-CHARS --no-init --quit-if-one-screen"
set -x PIPENV_DONT_LOAD_ENV 1
set -x SHELL (which fish)
set -x VISUAL vim

if not set -q TMUX
  set -x PATH $PATH $GOPATH/bin
  set -x PATH $HOME/.bin $PATH
  set -x PATH .git/safe/../../bin $PATH
end

alias ag "ag --pager less --color-line-number '1;34'"
alias g git
alias pm "python manage.py"
alias v $VISUAL
