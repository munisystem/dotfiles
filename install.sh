#!/bin/sh
os=$(uname | tr "[A-Z]" "[a-z]")

dotfiles=$HOME/dotfiles
cd $dotfiles
bin/itamae local itamae/roles/$os/default.rb
