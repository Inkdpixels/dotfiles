#!/bin/sh
#
# Set things up
# ./bootstrap.sh
#



###############################################################################
# Shortcuts                                                                   #
###############################################################################
# Set up the shortcut to this dotfiles folder
export DOTFILES=$HOME/.dotfiles


###############################################################################
# Copy the dotfiles to the system positions                                   #
###############################################################################
for file in $DOTFILES/.{aliases,bash_profile,bash_prompt,bashrc,gitconfig}; do
	cp -R "$file" $HOME
done


###############################################################################
# Loading all other files                                                     #
###############################################################################
# Setting up osx defaults
$DOTFILES/osx/./setup

# Setting up Sublime Text 2 - Disabled by default (USER CHOICE)
# $DOTFILES/sublime2/./setup


###############################################################################
# Kill affected applications                                                  #
###############################################################################
echo "Done. Note that some of these changes require a logout/restart to take effect. Killing the the affected processes now."
sleep 3 # Wait a bit so the user can read the message

for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
  "Safari" "SystemUIServer" "Terminal" "Twitter" "iCal" "iTunes"; do
  killall "$app" > /dev/null 2>&1
done