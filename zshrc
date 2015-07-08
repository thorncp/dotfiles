bindkey -e

bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

export PATH=~/bin:$PATH

autoload -U compinit
compinit

HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

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
    echo " %{$fg_bold[yellow]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}

exit_color="%{$fg[green]%}%(?..%{$fg[red]%})"

setopt promptsubst
export PS1='${exit_color}%~%{$reset_color%}$(git_prompt_info)
%# '

autoload -U select-word-style
select-word-style bash
