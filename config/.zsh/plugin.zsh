zi_home="${HOME}/.zi"
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
    command mkdir -p $zi_home
    command git clone https://github.com/z-shell/zi.git "${zi_home}/bin" 
fi
source "${zi_home}/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zi creinstall -q .' \
      zsh-users/zsh-completions

