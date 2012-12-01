#!/bin/sh
#
# Copy the dotfiles to the system positions.

for file in ~/.dotfiles/.{aliases,bash_profile,bash_prompt,bashrc}; do
	cp -R "$file" $HOME
done