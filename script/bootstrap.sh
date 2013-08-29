#!/usr/bin/env bash
#
# Set things up
#

##############################################################################################
# Shortcuts & Helper import
##############################################################################################
# shortcut to this dotfiles path is $DOTFILES
export DOTFILES=$HOME/.dotfiles
source lib/utils;

# Applications wich will be installed via 'Homebew Cask'
# @see https://github.com/phinze/homebrew-cask/tree/master/Casks
APPSTACK="blender dropbox firefox firefox-aurora google-chrome google-chrome-canary gmail-notifr growlnotify insync imagealpha imageoptim iterm2 keepass-x libre-office little-snitch opera skype spotify sublime-text the-unarchiver thunderbird virtualbox vlc webstorm"


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
killall Terminal


##############################################################################################
# Setup OSX
##############################################################################################
source osx/defaults.sh


##############################################################################################
# Cleanup (and update) the brew installation
##############################################################################################
source homebrew/update.sh
