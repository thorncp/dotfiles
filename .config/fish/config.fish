set fish_greeting ""
set fish_features qmark-noglob

set -x DIFF colordiff
set -x EDITOR vim
set -x FZF_DEFAULT_COMMAND 'ag --hidden -g ""'
set -x GOPATH $HOME/go
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x LESS "--RAW-CONTROL-CHARS --no-init --quit-if-one-screen"
set -x PIPENV_DONT_LOAD_ENV 1
set -x SHELL (which fish)
set -x VISUAL vim

function addpaths
  contains -- $argv $fish_user_paths
    or set -U fish_user_paths $argv $fish_user_paths
end

addpaths $GOPATH/bin
addpaths $HOME/.asdf/bin
addpaths $HOME/.asdf/shims
addpaths $HOME/.bin
addpaths $HOME/.fzf/bin
addpaths .git/safe/../../bin
addpaths /usr/local/sbin

abbr --add g git
abbr --add v $VISUAL
abbr --add pm "pipenv run python manage.py"

alias ag "ag --pager less --color-line-number '1;34'"
