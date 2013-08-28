#!/usr/bin/env bash

# Generate a gitconfig (Based on the gitconfig.example)
if ! [ -f git/gitconfig.symlink ]
then
	p_info 'Setup gitconfig'
	git_credential='osxkeychain'

	p_user ' - What is your github author name?'
	read -e git_authorname
	p_user ' - What is your github author email?'
	read -e git_authoremail

	sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.example > git/gitconfig.symlink

	p_success 'The Gitconfig-File was written successfully'
fi

# Create symlinks
symlink "$DOTFILES/git/gitattributes.symlink" "$HOME/.gitattributes"
symlink "$DOTFILES/git/gitconfig.symlink" "$HOME/.gitconfig"
symlink "$DOTFILES/git/gitignore.symlink" "$HOME/.gitignore"