bindkey -e

PATH="$HOME/.cargo/bin:$PATH"
PATH=~/bin:$PATH

autoload -U compinit
compinit

export HISTFILE=~/.zhistory
export HISTSIZE=4096
export SAVEHIST=4096

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

export LSCOLORS=ExFxCxDxBxegedabagacad

[[ -f ~/.aliases ]] && source ~/.aliases

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# override with custom color
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[blue]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}

exit_color="%{$fg[green]%}%(?..%{$fg[red]%})"

setopt promptsubst
PS1='${exit_color}%~%{$reset_color%}$(git_prompt_info)
%# '

autoload -U select-word-style
select-word-style bash

if [ -d "$HOME/.asdf" ]; then
  . $HOME/.asdf/asdf.sh
fi

export PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
