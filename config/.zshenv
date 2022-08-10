export ZDOTDIR=$HOME/.zsh

# language
export LANG=en_US.UTF-8
export LC_LANG=en_US.UTF-8

# editor
export EDITOR=/opt/homebrew/bin/nvim

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config

setopt no_global_rcs
export PATH=/usr/local/bin:$PATH

# asdf-vm
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Google Cloud SDK
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
