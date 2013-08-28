#!/usr/bin/env bash

# Check if the z script is present.
if ! [ -f $DOTFILES/z/z.sh ]
then
	p_info 'Downloading z'
	curl https://raw.github.com/rupa/z/master/z.sh > $DOTFILES/z/z.sh
	chmod +x $DOTFILES/z/z.sh
else
	p_success "The z script is present."
fi