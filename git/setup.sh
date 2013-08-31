#!/usr/bin/env bash

# Generate a gitconfig (Based on the gitconfig.example)
if ! [ -f git/gitconfig.symlink ]
then
	p_info 'Setup gitconfig'

	p_user ' - What is your Git author name?'
	read -e git_authorname
	p_user ' - What is your Git author email?'
	read -e git_authoremail

	sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" git/gitconfig.example > git/gitconfig.symlink

	p_success 'The Gitconfig-File was written successfully'
fi

# Create symlinks
symlink "$DOTFILES/git/gitattributes.symlink" "$HOME/.gitattributes"
symlink "$DOTFILES/git/gitconfig.symlink" "$HOME/.gitconfig"
symlink "$DOTFILES/git/gitignore.symlink" "$HOME/.gitignore"