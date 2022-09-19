# XDG Based directory
export XDG_CONFIG_HOME=$HOME/.config

# Use XDG Based directory in zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Language
export LANG=en_US.UTF-8
export LC_LANG=en_US.UTF-8

# Default editor
export EDITOR=/opt/homebrew/bin/nvim

setopt no_global_rcs
export PATH=/usr/local/bin:$PATH

# asdf-vm
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Go
[ -n "$(go env GOBIN)" ] && export PATH="$(go env GOBIN):${PATH}"
[ -n "$(go env GOPATH)" ] && export PATH="$(go env GOPATH)/bin:${PATH}"
export GOGO111MODULE=on

# Google Cloud SDK
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
