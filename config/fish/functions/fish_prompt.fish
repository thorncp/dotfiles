function fish_prompt
  set prev_status $status

  # if previous command succeeded, things are green, otherwise red
  if test $prev_status -eq 0
    set status_color green
  else
    set status_color red
  end

  # full width seperator line
  set_color $status_color
  printf '%*s\n' $COLUMNS "" | tr ' ' ─

  # a faintly colored timestamp
  set_color white
  set timestamp (date "+%H:%M:%S")
  printf "$timestamp "

  # current directory
  set_color $status_color
  printf (dirs)" "

  # git branch
  set_color blue
  printf '%s' (git branch ^/dev/null | grep \* | sed 's/* //')

  # new line
  echo

  set_color normal
  echo "% "
end
