# function

__fzf_select_history() {
  local tac=${commands[tac]:-"tail -r"}

  BUFFER=$(\history -n 1 | \
    eval $tac | \
    fzf --reverse)
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

__fzf_kubectx() {
  local context=$(kubectl config get-contexts -o name | fzf --reverse)
  if [[ -n "$context" ]]; then
    kubectx ${context}
  fi
}

__fzf_kubens() {
  local namespace=$(kubectl get ns -o name | sed 's/namespaces\///g' | fzf --reverse)
  if [[ -n "$namespace" ]]; then
    kubens ${namespace}
  fi
}

kssh() {
  local help="$0 -- ssh pod

  * $0 nginx     (kubectl exec -it nginx bash)
  * $0 app rails (kubectl exec -it nginx -c rails bash)
"
  local pod=$1
  local container=$2

  if [[ -z $pod ]]; then
    echo $help >&2
    return 22
  fi

  [[ -n $container ]] && kubectl exec -it $pod -c $container bash || kubectl exec -it $pod bash
  if [[ $? -eq 0 ]]; then
    return 0
  fi

  [[ -n $container ]] && kubectl exec -it $pod -c $container sh || kubectl exec -it $pod sh
  return $?
}

kc() {
  local ctx=$(kubectl config current-context)
  local ns="$(kubectl config view --minify -o "jsonpath={..namespace}")"
  echo "$ctx/$ns"
}

__fzf_checkout_branch() {
  local branch=$(git branch --all | grep -v HEAD | fzf --reverse)
  if [[ -n "$branch" ]]; then
    git checkout `echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##"`
  fi
}
