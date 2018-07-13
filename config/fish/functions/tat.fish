function tat
  set parent (basename (dirname $PWD))
  set child (basename $PWD | tr . -)
  set session_name $parent/$child

  if test -z $TMUX
    tmux new-session -As $session_name -n code -d
    tmux new-window -t $session_name -n server
    tmux new-window -t $session_name -n console
    tmux select-window -t $session_name -n
    tmux attach -t $session_name
  else
    set session exists (tmux list-sessions | sed -E 's/:.*$//' | grep -q ^$session_name$)
    if not session_exists
      eval TMUX='' tmux new-session -Ad -s $session_name
    end
    tmux switch-client -t $session_name
  end
end
