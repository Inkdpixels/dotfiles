#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
p_info "Updating Homebrew..."
brew update

# Upgrade any already-installed brew-formula
p_info "Upgrading any installed Homebrew formulas..."
brew upgrade

# Remove outdated brew-formulas
p_info "Removing any outdated Homebrew formulas..."
brew cleanup