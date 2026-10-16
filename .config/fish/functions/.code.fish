function .code
  set -l code_path (fd . ~/code --type d --max-depth 2 | fzf)
  if test -n "$code_path"
    cd "$code_path"
    and clear
  end
end
