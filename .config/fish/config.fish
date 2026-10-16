set fish_greeting ""
set -U fish_features qmark-noglob,ampersand-nobg-in-token

set -x DIFF colordiff
set -x EDITOR (which vim)
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x GOPATH $HOME/go
set -x GPG_TTY (tty)
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x LESS "--RAW-CONTROL-CHARS --no-init --quit-if-one-screen"
set -x PIPENV_DONT_LOAD_ENV 1
set -x SHELL (which fish)
set -x VISUAL $EDITOR
set -x PSQL_PAGER less -S

function addpaths
  contains -- $argv $fish_user_paths
    or set -U fish_user_paths $argv $fish_user_paths
end

if test -e ~/.config/fish/config.local.fish
  source ~/.config/fish/config.local.fish
end

addpaths $GOPATH/bin
addpaths $HOME/.asdf/shims
addpaths $HOME/.bin
addpaths $HOME/.bin.local
addpaths $HOME/.fzf/bin
addpaths .git/safe/../../bin
addpaths /opt/homebrew/sbin
addpaths /opt/homebrew/bin
addpaths /usr/local/sbin

abbr --add g git
abbr --add v (basename $VISUAL)

ulimit -n 2560

fish_config theme choose ayu-mirage
