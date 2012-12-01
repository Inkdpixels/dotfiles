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
###############################################################################
# Kill affected applications                                                  #
###############################################################################
echo "Done. Note that some of these changes require a logout/restart to take effect. Killing the the affected processes now."

for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
  "Safari" "SystemUIServer" "Terminal" "Twitter" "iCal" "iTunes"; do
  killall "$app" > /dev/null 2>&1
done