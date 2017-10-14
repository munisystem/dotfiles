# environment

## zsh config directory
ZDOTDIR=$HOME/.zsh
export ZDOTDIR

## autoload
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zsh/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

## path
export PATH=/usr/local/bin:/usr/bin:/usr/sbin/:/sbin:/bin

## history
export HISTFILE="$HOME"/.zsh_history
export HISTSIZE=1000
export SAVEHIST=50000

## NVIM
XDG_CONFIG_HOME=$HOME/.config
export XDG_CONFIG_HOME

LC_LANG=ja.UTF-8
