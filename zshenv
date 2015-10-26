export TERM=xterm-256color

export VISUAL=vim
export EDITOR=$VISUAL
export DIFF=colordiff
export GOPATH=$HOME/go

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"
export PATH=$PATH:$GOPATH/bin

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/chris/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
