#!/usr/bin/env bash
#
# Set things up
#

##############################################################################################
# Shortcuts & Helper import
##############################################################################################
# shortcut to this dotfiles path is $DOTFILES
export DOTFILES=$HOME/.dotfiles

# Load in helper functions and print messages
source lib/utils;

# Load in the customized config.sh - If not present, use the example config
if ! [ -f config.sh ]
then
	p_user "No config file found"
	read -p "        Do you want to use the example-file? (y/n) " -n 1
	if [[ $REPLY =~ ^[Yy]$ ]] ; then
		source config.sh.example
	else
		cp config.sh.example config.sh
		open -a TextEdit config.sh
		p_fail "Please edit the config file and run the bootstrap script again."
	fi
fi


##############################################################################################
# Ask for the administrator password upfront
##############################################################################################
sudo -v
# Keep-alive: update existing `sudo` time stamp until 'bootstrap.sh' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


##############################################################################################
# Install dependencies
##############################################################################################
for file in {xcode,homebrew,git,node,grunt-cli,ssh,z}/install.sh; do
	source $file
done


##############################################################################################
# Set up Git
##############################################################################################
source git/setup.sh


##############################################################################################
# Set up the bash
##############################################################################################
source bash/setup.sh


##############################################################################################
# Install Homebrew packages
##############################################################################################
source homebrew/packages.sh


##############################################################################################
# Install Ruby Gems
##############################################################################################
source ruby/install-gems.sh


##############################################################################################
# Install some Applications
##############################################################################################
source osx/install-apps


##############################################################################################
# Add the iTerm color scheme to the Application-Settings
##############################################################################################
open -a iTerm
sleep 1 # Wait a bit to make sure the application is open
open $DOTFILES/lib/Inkdpixels-Dark.itermcolors
killall iTerm


##############################################################################################
# Setup Sublime Text
##############################################################################################
source sublime-text/setup.sh


##############################################################################################
# Setup OSX
##############################################################################################
source osx/defaults.sh


##############################################################################################
# Cleanup (and update) the brew installation
##############################################################################################
source homebrew/update.sh
