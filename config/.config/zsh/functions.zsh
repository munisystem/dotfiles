__fzf_select_history() {
  BUFFER=$(\history -n -r 1 | \
    fzf +s +m -x -e --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N __fzf_select_history

__fzf_ghq() {
  local selected_dir=$(ghq list -p | fzf --reverse)
  if [[ -n "$selected_dir" ]]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N __fzf_ghq

__fzf_checkout_branch() {
  local branch=$(git branch --all | grep -v HEAD | fzf --reverse)
  if [[ -n "$branch" ]]; then
    git checkout `echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##"`
  fi
}
