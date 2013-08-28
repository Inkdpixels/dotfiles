#!/usr/bin/env bash
#
# Set things up
#

##############################################################################################
# Shortcuts & Helper import
##############################################################################################
# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/.dotfiles
source lib/utils;

# Applications wich will be installed via 'Homebew Cask'
# @see https://github.com/phinze/homebrew-cask/tree/master/Casks
APPSTACK="blender dropbox firefox firefox-aurora google-chrome google-chrome-canary gmail-notifr growlnotify insync imagealpha imageoptim iterm2 keepass-x libre-office little-snitch opera skype spotify sublime-text the-unarchiver thunderbird virtualbox vlc webstorm"


##############################################################################################
# Install dependencies
##############################################################################################
#for file in $(find . -iname 'install.dep'); do
#	source $file
#done
for file in xcode/install.dep homebrew/install.dep git/install.dep node/install.dep grunt-cli/install.dep ssh/install.dep
	do
		source $file
done


##############################################################################################
# Set up Git
##############################################################################################


##############################################################################################
# Symlink all files
##############################################################################################


##############################################################################################
# Set up Git
##############################################################################################


##############################################################################################
# Bash installation
##############################################################################################


##############################################################################################
# Setup OSX
##############################################################################################


##############################################################################################
# Install some Applications
##############################################################################################
source osx/install-apps