# function

__peco_select_history() {
  local tac=${commands[tac]:-"tail -r"}

  BUFFER=$(\history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N __peco_select_history

__peco_ghq() {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [[ -n "$selected_dir" ]]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N __peco_ghq

  fi
}
