# environment

## zsh config directory
ZDOTDIR=$HOME/.zsh
export ZDOTDIR

## autoload
autoload -Uz compinit && compinit -u

## path
export PATH=/usr/local/bin:/usr/bin:/usr/sbin/:/sbin:/bin

## history
export HISTFILE="$HOME"/.zsh_history
export HISTSIZE=1000
export SAVEHIST=50000

## NVIM
XDG_CONFIG_HOME=$HOME/.config
export XDG_CONFIG_HOME

## Golang
GOPATH=$HOME/repos
export GOPATH
export PATH=$GOPATH/bin:$PATH

## ruby
# export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

## python
PYENV_ROOT=$HOME/.pyenv
export PYENV_ROOT
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

## rust
export PATH=$HOME/.cargo/bin:$PATH

## node
## export NVM_DIR="$HOME/.nvm"
## . "/usr/local/opt/nvm/nvm.sh"

# sbox
SBOX_ROOT=$HOME/sandbox
export SBOX_ROOT

