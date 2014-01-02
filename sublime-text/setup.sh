#!/usr/bin/env bash

# Setup symlink for Sublime Text 3 settings
sublime_dir=$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages
symlink "$DOTFILES/sublime-text/User" "$sublime_dir"

# Grab the FreshCut theme
git clone https://github.com/daylerees/colour-schemes.git "$sublime_dir/Dayle Rees Color Schemes"

# Symlinking the "subl" terminal shortcut
mkdir ~/bin
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl