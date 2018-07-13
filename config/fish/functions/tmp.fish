function tmp
  if count $argv > /dev/null
    eval $EDITOR $HOME/tmp.$argv
  else
    eval $EDITOR $HOME/tmp.md
  end
end
