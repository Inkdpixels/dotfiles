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
    # Copy `.gitconfig`.
    # Any global git commands in `~/.bash_profile.local` will be written to
    # `.gitconfig`. This prevents them being committed to the repository.
    # rsync -avz --quiet ${DOTFILES_DIRECTORY}/git/gitconfig  ${HOME}/.gitconfig


    # Create the necessary symbolic links between the `.dotfiles` and `HOME`
    link "bash/.aliases"       ".aliases"
    link "bash/.bash_profile"  ".bash_profile"
    link "bash/.bash_prompt"   ".bash_prompt"
    link "bash/.bashrc"        ".bashrc"
    link "bash/.exports"       ".exports"
    link "bash/.functions"     ".functions"

    link "git/.gitattributes"  ".gitattributes"
    link "git/.gitconfig"      ".gitconfig"
    link "git/.gitignore"      ".gitignore"

    echo
    e_success "Dotfiles are symlinked!"
}



# Ask for the administrator password upfront
sudo -v

###############################################################################
# Check for any required software                                             #
###############################################################################
# Before relying on Homebrew, check that packages can be compiled
echo "  Doing some checks to see if all required software packages are installed"
install_deps



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
# Check if SASS is installed
if ! type_exists 'sass'; then
    e_warning "SASS is not installed"
    read -p "Install it? (y/n) " -n 1
    if [[ $REPLY =~ ^[Yy]$ ]] ; then
        sudo gem install sass
        if ! type_exists 'sass'; then
            e_success "SASS has been successfully installed."
        fi
    else
        e_moveon "Moving on to the next step..."
    fi
else
    e_success "SASS is installed."
fi

# Check if Compass is installed
if ! type_exists 'compass'; then
    e_warning "Compass is not installed"
    read -p "Install it? (y/n) " -n 1
    if [[ $REPLY =~ ^[Yy]$ ]] ; then
        sudo gem install sass
        if ! type_exists 'compass'; then
            e_success "Compass has been successfully installed."
        fi
    else
        e_moveon "Moving on to the next step..."
    fi
else
    e_success "Compass is installed."
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