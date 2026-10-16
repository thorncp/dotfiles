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
set -x TF_CLI_ARGS_plan "-parallelism=200"
set -x TF_CLI_ARGS_apply "-parallelism=200"

function addpaths
  set -l paths $argv
  for entry in $fish_user_paths
    contains -- $entry $paths; or set -a paths $entry
  end
  set -g fish_user_paths $paths
end

# set up lowest priority first. these will be at the end of $PATH
addpaths /opt/homebrew/bin /opt/homebrew/sbin /usr/local/sbin

if test -e ~/.config/fish/config.local.fish
  source ~/.config/fish/config.local.fish
end

if test -d "$HOME/.bun"
  set --export BUN_INSTALL "$HOME/.bun"
  addpaths $BUN_INSTALL/bin
end

# we want these at the beginning of $PATH, in the order provided here. i.e.
# .git/safe will override everything
addpaths .git/safe/../../bin \
  $HOME/.bin.local \
  $HOME/.bin \
  $HOME/.asdf/shims \
  $GOPATH/bin \
  $HOME/.fzf/bin

abbr --add g git
abbr --add v (basename $VISUAL)

ulimit -n 2560

fish_config theme choose ayu-mirage
