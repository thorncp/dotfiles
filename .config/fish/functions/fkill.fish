function fkill
  set -l header (ps aux | head -1)
  set -l pid (ps aux | fzf -e --header "$header" | tr -s " " | cut -d ' ' -f 2)

  if test -n "$pid"
    kill -9 $pid
  end
end
