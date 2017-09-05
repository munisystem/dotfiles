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

# sbox
SBOX_ROOT=$HOME/sandbox
export SBOX_ROOT

LC_LANG=ja.UTF-8
