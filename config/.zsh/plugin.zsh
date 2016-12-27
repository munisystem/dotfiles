# plugin
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "rupa/z", use:z.sh

zplug 'zsh-users/zsh-autosuggestions', defer:1
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "mafredri/zsh-async", "on:sindresorhus/pure"
zplug "sindresorhus/pure"

zplug load
