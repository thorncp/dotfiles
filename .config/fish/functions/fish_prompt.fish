function fish_prompt
  set prev_status $status
  set git_branch (git branch 2> /dev/null | grep \* | sed 's/* //')

  if test $prev_status -eq 0
    set status_color green
  else
    set status_color red
  end

  set_color --background $status_color
  set_color brwhite
  printf "☢︎ "(basename (pwd))" "

  if test -n "$git_branch"
    set_color --background white
  else
    set_color --background normal
  end
  set_color $status_color
  printf "\ue0b0 "

  if test -n "$git_branch"
    set_color --background white
    set_color brwhite
    printf '%s ' $git_branch
    set_color --background normal
    set_color white
    printf "\ue0b0 "
  end

  set_color normal
  set_color --background normal
end
