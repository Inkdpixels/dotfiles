#!/usr/bin/env bash

# Check if Git is already installed
if ! type_exists 'git'; then
	p_info "Git is not installed."
	brew install git
	if ! type_exists 'git'; then
		p_fail "Something went wrong..."
	fi
else
	p_success "Git is installed."
fi