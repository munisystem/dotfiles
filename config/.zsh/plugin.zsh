# Added by Zinit's installer
if [[ ! -f $HOME/.zsh/.zinit/bin/zinit.zsh ]]; then
    command mkdir -p "$HOME/.zsh/.zinit" && command chmod g-rwX "$HOME/.zsh/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zsh/.zinit/bin" 
fi
source "$HOME/.zsh/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light 'zsh-users/zsh-autosuggestions'
zinit light "zsh-users/zsh-completions"
zinit light "zsh-users/zsh-syntax-highlighting"

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
