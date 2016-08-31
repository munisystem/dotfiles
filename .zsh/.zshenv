# environment

## zsh config directory
ZDOTDIR=$HOME/.zsh
export ZDOTDIR

## path
export PATH=/usr/local/bin:/usr/bin:/usr/sbin/:/sbin:/bin

## Golang
GOPATH=$HOME/repos
export GOPATH
export PATH=$GOPATH:$PATH

## ruby
export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

## history
export HISTFILE="$HOME"/.zsh_history
export HISTSIZE=1000
export SAVEHIST=50000
