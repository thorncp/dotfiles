function tat
  set parent (basename (dirname $PWD))
  set child (basename $PWD | tr . -)
  set session_name $parent/$child

  if test -n "$TMUX"
    echo "leave tmux first" >&2
    return 1
  end

  set session_exists (tmux ls -F '#S' | grep "$session_name")

  if test -n "$session_exists"
    tmux attach -t $session_name
  else
    tmux new-session -As $session_name -n code -d
    tmux new-window -t $session_name -n server
    tmux new-window -t $session_name -n console
    tmux select-window -t $session_name -n
    tmux attach -t $session_name
  end
end
