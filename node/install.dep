#!/usr/bin/env bash

# Check if Node.js is already installed
if ! type_exists 'node'; then
	p_info "Node.js is not installed."
	brew install node
	if ! type_exists 'node'; then
		p_fail "Something went wrong..."
	fi
else
	p_success "Node.js is installed."
fi

# Check if the Node Package Manager is already installed
if ! type_exists 'npm'; then
	p_info "The Node Package Manager is not installed."
	curl https://npmjs.org/install.sh | sh
	if ! type_exists 'npm'; then
		p_fail "Something went wrong..."
	fi
else
	p_success "The Node Package Manager is installed."
fi