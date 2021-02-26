# Initialize
## plugin
. "$ZDOTDIR/plugin.zsh"

## function
. "$ZDOTDIR/function.zsh"

## alias
. "$ZDOTDIR/alias.zsh"

## keybind
. "$ZDOTDIR/keybind.zsh"

# config
setopt hist_ignore_all_dups
setopt hist_no_store
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_history
setopt share_history 

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## internal tools
export PATH=$HOME/.wantedly/bin:$PATH

## Golang
export GOPATH=$HOME/repos
export PATH=$GOPATH/bin:$PATH

## rust
export PATH=$HOME/.cargo/bin:$PATH

## Kubernetes
source <(kubectl completion zsh)
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

## asdf-vm
. /usr/local/opt/asdf/asdf.sh

## gcloud
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
