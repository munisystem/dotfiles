#!/bin/sh
os=$(uname | tr "[A-Z]" "[a-z]")

bin/itamae local itamae/roles/$os/default.rb
