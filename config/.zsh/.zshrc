# Initialize

## Golang
GOPATH=$HOME/repos
export GOPATH
export PATH=$GOPATH/bin:$PATH

## ruby
# export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

## plugin
. "$ZDOTDIR/plugin.zsh"

## function
. "$ZDOTDIR/function.zsh"

## alias
. "$ZDOTDIR/alias.zsh"

## keybind
. "$ZDOTDIR/keybind.zsh"

# config
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# autoload
autoload -Uz compinit && compinit -u
