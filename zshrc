bindkey -e

bindkey '^[[1;5C' forward-word # mapped in iterm as ctrl+right
bindkey '^[[1;5D' backward-word # mapped in iterm as ctrl+left

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
