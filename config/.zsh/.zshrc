# Initialize

## internal tools
export PATH=$HOME/.wantedly/bin:$PATH

## Golang
GOPATH=$HOME/repos
export GOPATH
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on

## ruby
export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init - --no-rehash)"

## node
source $(brew --prefix nvm)/nvm.sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

## rust
export PATH=$HOME/.cargo/bin:$PATH

## Kubernetes
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

## asdf-vm
. $(brew --prefix asdf)/asdf.sh

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

## kubectl
# source <(kubectl completion zsh)

## gcloud

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"
