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
export HISTSIZE=100000
export SAVEHIST=100000

## NVIM
export XDG_CONFIG_HOME=$HOME/.config

export LANG=en_US.UTF-8
export LC_LANG=en_US.UTF-8
