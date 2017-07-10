# Initialize

## Golang
GOPATH=$HOME/repos
export GOPATH
export PATH=$GOPATH/bin:$PATH

## ruby
export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

## node
export PATH=/usr/local/var/nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew

## python
PYENV_ROOT=$HOME/.pyenv
export PYENV_ROOT
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

## rust
export PATH=$HOME/.cargo/bin:$PATH

#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

## plugin
. "$ZDOTDIR/plugin.zsh"

## function
. "$ZDOTDIR/function.zsh"

## alias
. "$ZDOTDIR/alias.zsh"

## keybind
. "$ZDOTDIR/keybind.zsh"

# config
setopt hist_ignore_all_dups
setopt hist_no_store
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt EXTENDED_HISTORY

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
