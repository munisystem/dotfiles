#!/bin/sh
os=$(uname | tr "[A-Z]" "[a-z]")

dotfiles=$HOME/dotfiles
if [ -d "$dotfiles" ]; then
  echo "👍  Skip install remote dotfiles."
else
  git clone git@github.com:munisystem/dotfiles "$dotfiles"
fi

cd $dotfiles
bin/itamae local itamae/roles/$os/default.rb
