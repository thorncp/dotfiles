export TERM=xterm-256color

export VISUAL=nvim
export EDITOR=$VISUAL
export DIFF=colordiff

# run NeoVim in true color mode
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

export DISABLE_SPRING=1
