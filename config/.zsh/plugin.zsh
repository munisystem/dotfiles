# plugin
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-autosuggestions', nice:10
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:18

zplug "mafredri/zsh-async", "on:sindresorhus/pure"
zplug "sindresorhus/pure"

zplug load --verbose
