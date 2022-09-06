# Reset all bindkeys
bindkey -d

# Use emacs like keybinds
bindkey -e

# search command histories using fzf
bindkey '^R' __fzf_select_history

# search git projects using fzf
bindkey '^]''r' __fzf_ghq
