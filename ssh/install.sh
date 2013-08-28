#!/usr/bin/env bash

# Check if SSH is already installed
if ! type_exists 'ssh'; then
	p_info "SSH is not installed."
	brew tap homebrew/dupes
	brew install openssh
	if ! type_exists 'ssh'; then
		p_fail "Something went wrong..."
	fi
else
	p_success "SSH is installed."
fi