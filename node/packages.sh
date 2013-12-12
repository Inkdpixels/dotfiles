#!/usr/bin/env bash

# Check if the Grunt-CLI is already installed
if ! type_exists 'grunt'; then
	p_info "Grunt is not installed."
	npm install -g grunt-cli
	if ! type_exists 'grunt'; then
		p_fail "Something went wrong..."
	fi
else
	p_success "Grunt is installed."
fi

# Check if Bower is already installed
if ! type_exists 'bower'; then
	p_info "Bower is not installed."
	npm install -g bower
	if ! type_exists 'bower'; then
		p_fail "Something went wrong..."
	fi
else
	p_success "Bower is installed."
fi