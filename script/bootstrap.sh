#!/bin/sh
#
# Set things up
# ./bootstrap.sh
#

# Set up the shortcut to this dotfiles folder
export DOTFILES=$HOME/.dotfiles

# Copy the dotfiles to the system positions.
for file in $DOTFILES/.{aliases,bash_profile,bash_prompt,bashrc}; do
	cp -R "$file" $HOME
done