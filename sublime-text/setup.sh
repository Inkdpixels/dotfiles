#!/usr/bin/env bash

# Setup symlink for Sublime Text 2 settings
sublime_dir=$HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages
symlink "$DOTFILES/sublime-text/User" "$sublime_dir"

# Grab the FreshCut theme
git clone https://github.com/daylerees/colour-schemes.git "$sublime_dir/Dayle Rees Color Schemes"