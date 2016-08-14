# fish.config
# Initialize
set -U fish_user_paths /bin
set -U fish_user_paths /sbin $fish_user_paths
set -U fish_user_paths /usr/sbin $fish_user_paths
set -U fish_user_paths /usr/bin $fish_user_paths
set -U fish_user_paths /usr/local/bin $fish_user_paths

# # rbenv
set -U fish_user_paths $fish_user_paths "$HOME/.rbenv/shims"
rbenv rehash ^/dev/null ^&1

# go
set -x GOPATH "$HOME/.go"
set -U fish_user_paths $fish_user_paths "$GOPATH/bin"

# peco
function peco_select_history
  if test (count $argv) = 0
    set peco_flags
  else
    set peco_flags --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

# key bindings
function fish_user_key_bindings
  bind \cs peco_select_history
  bind \c] peco_select_ghq_repository
end
