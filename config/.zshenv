export ZDOTDIR=$HOME/.zsh

# language
export LANG=en_US.UTF-8
export LC_LANG=en_US.UTF-8

# editor
export EDITOR=/usr/local/bin/nvim

# local path
export PATH=/usr/local/bin:$PATH

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config

# tools for Wantedly, Inc.
export PATH=$HOME/.wantedly/bin:$PATH

## Go
export GOPATH=$HOME/repos
export PATH=$GOPATH/bin:$PATH

## Rust
export PATH=$HOME/.cargo/bin:$PATH

## Kubernetes
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

## asdf-vm
. /usr/local/opt/asdf/asdf.sh

# google-cloud-sdk
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
