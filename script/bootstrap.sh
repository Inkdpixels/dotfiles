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

# Getting the helper functions
source ./script/lib/utils
source ./script/lib/install-deps

# Symlink function
mirrorfiles() {
	# Create the necessary symbolic links between the `.dotfiles` and `HOME`
	link "bash/aliases"       ".aliases"
	link "bash/bash_profile"  ".bash_profile"
	link "bash/bash_prompt"   ".bash_prompt"
	link "bash/bashrc"        ".bashrc"
	link "bash/exports"       ".exports"
	link "bash/functions"     ".functions"

	# Git Configuration files
	link "git/gitattributes"  ".gitattributes"
	link "git/gitconfig"      ".gitconfig"
	link "git/gitignore"      ".gitignore"

	echo
	e_success "Dotfiles are symlinked!"
}



# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until 'bootstrap.sh' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Check for any required software                                             #
###############################################################################
# Before relying on Homebrew, check that packages can be compiled
echo "  Doing some checks to see if all required software packages are installed"
install_deps



###############################################################################
# Installing native Applications                                              #
###############################################################################
e_header "
===============================================================================
= Native Apps                                                                 =
==============================================================================="
echo "This will install basic applications to setup a production system"
read -p "Continue? (y/n) " -n 1
echo

if [[ $REPLY =~ ^[Yy]$ ]] ; then
	$DOTFILES/script/lib/./install-apps
else
	e_moveon "Moving on to the next step..."
fi



###############################################################################
# Setting up OSX Defaults                                                     #
###############################################################################
e_header "
===============================================================================
= OSX Defaults                                                                =
==============================================================================="
echo "This will set up some sensible OS X defaults"
read -p "Continue? (y/n) " -n 1
echo

if [[ $REPLY =~ ^[Yy]$ ]] ; then
	$DOTFILES/osx/./setup
else
	e_moveon "Moving on to the next step..."
fi



###############################################################################
# Copy the dotfiles to the system positions                                   #
###############################################################################
# Verify that the user wants to proceed before potentially overwriting files
e_header "
===============================================================================
= DOTFILES                                                                    =
==============================================================================="
e_warning "Warning: This may overwrite your existing dotfiles."
read -p "Continue? (y/n) " -n 1
echo

if [[ $REPLY =~ ^[Yy]$ ]] ; then
	mirrorfiles
else
	e_moveon "Moving on to the next step..."
fi



###############################################################################
# Setting up Sublime Text 2                                                   #
###############################################################################
# Verify that the user wants to proceed before potentially overwriting files
e_header "
===============================================================================
= SUBLIME TEXT 2                                                              =
==============================================================================="
e_warning "Warning: This will symlink your user preferences to this dotfile repo."
echo "A Backup will be made in '~/Library/Application Support/Sublime Text 2/Packages/User.backup'."
read -p "Continue? (y/n) " -n 1
echo

if [[ $REPLY =~ ^[Yy]$ ]] ; then
	$DOTFILES/sublime2/./setup
else
	e_moveon "Moving on to the next step..."
fi



###############################################################################
# Installing some ruby gems                                                   #
###############################################################################
e_header "
===============================================================================
= RUBY GEMS                                                                   =
==============================================================================="
# Check if Compass is installed
if ! type_exists 'compass'; then
	e_warning "Compass is not installed"
	read -p "Install it? (y/n) " -n 1

	if [[ $REPLY =~ ^[Yy]$ ]] ; then
		# Check if SASS is installed as its a dependency of Compass
		if ! type_exists 'sass'; then
			e_header "Installing SASS..."
			gem install sass
			# Test if SASS was installed successfully
			if ! type_exists 'sass'; then
				exit 1
			fi
		fi
		e_header "Installing Compass..."
		gem install compass
		# Test if compass was installed successfully
		if ! type_exists 'compass'; then
			e_success "Compass has been successfully installed."
		fi
	# If the user input was nN
	else
		e_moveon "Moving on to the next step..."
	fi
else
	e_success "Compass is installed."
fi

# Check if Rake is installed
if ! type_exists 'rake'; then
	echo "Rake is not installed"
	gem install rake
else
	e_success "Rake is installed."
fi

# Update all installed Ruby gems
read -p "Update all installed Ruby gems? (y/n) " -n 1
if [[ $REPLY =~ ^[Yy]$ ]] ; then
	gem update
fi



###############################################################################
# Kill affected applications                                                  #
###############################################################################
e_header "
===============================================================================
= DONE                                                                        =
==============================================================================="
echo "Note that some of these changes require a logout/restart to take effect."
read -p "Kill all affected applications? (y/n) " -n 1
echo

if [[ $REPLY =~ ^[Yy]$ ]] ; then
	for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
	  "Safari" "SystemUIServer" "Terminal" "Twitter" "iCal" "iTunes"; do
	  killall "$app" > /dev/null 2>&1
	done
else
	echo "$(tput setaf 1)Aborting...";
	exit 1
fi