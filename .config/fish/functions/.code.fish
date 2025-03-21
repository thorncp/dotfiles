function .code
  set -l code_path (find ~/code -maxdepth 2 -type d | fzf)
  if test -n "$code_path"
    cd "$code_path"
    and clear
  end
end
