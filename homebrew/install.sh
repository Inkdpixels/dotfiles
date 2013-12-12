#!/usr/bin/env bash

# Check if Homebrew is already installed
if ! type_exists 'brew'; then
	p_info "Homebrew is not installed."
	ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go/install)"
	brew doctor
	if ! type_exists 'brew'; then
		p_fail "Something went wrong..."
	fi
else
	p_success "Homebrew is installed."
fi