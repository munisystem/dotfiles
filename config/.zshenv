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

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Kubernetes
export PATH="${PATH}:${HOME}/.krew/bin"

## Use new authentication method in GKE
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Go
export PATH="${PATH}:${HOME}/go/bin"

# Google Cloud SDK
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
