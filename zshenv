export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

export VISUAL=vim
export EDITOR=$VISUAL
export DIFF=colordiff

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"
