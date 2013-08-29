#!/usr/bin/env bash

# Create symlinks
symlink "$DOTFILES/bash/aliases.symlink" "$HOME/.aliases"
symlink "$DOTFILES/bash/bash_profile.symlink" "$HOME/.bash_profile"
symlink "$DOTFILES/bash/bash_prompt.symlink" "$HOME/.bash_prompt"
symlink "$DOTFILES/bash/bashrc.symlink" "$HOME/.bashrc"
symlink "$DOTFILES/bash/exports.symlink" "$HOME/.exports"
symlink "$DOTFILES/bash/functions.symlink" "$HOME/.functions"

# Use a modified version of the Pro theme by default in Terminal.app
open "$DOTFILES/lib/Mathias.terminal"