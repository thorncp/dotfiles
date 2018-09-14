function code
  cd (find ~/code $GOPATH/src/github.com -maxdepth 2 -type d | fzf)
  and clear
end
