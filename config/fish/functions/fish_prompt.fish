function fish_prompt
  set prev_status $status

  if test $prev_status -eq 0
    set status_color green
  else
    set status_color red
  end

  set_color --background $status_color
  set_color brwhite
  printf " "(dirs)" "

  set_color --background normal
  set_color $status_color
  printf "\ue0b0 "

  set_color normal
  set_color --background normal
end
