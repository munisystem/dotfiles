# plugins
. "$ZDOTDIR/plugin.zsh"

# functions
. "$ZDOTDIR/function.zsh"

# alias
. "$ZDOTDIR/alias.zsh"

# keybinds
. "$ZDOTDIR/keybind.zsh"

# prompt
. "$ZDOTDIR/prompt.zsh"

# history
setopt hist_ignore_all_dups
setopt hist_no_store
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_history
setopt share_history

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
