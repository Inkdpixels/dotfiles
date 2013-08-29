#!/usr/bin/env bash

# Check if SASS is already installed
if ! type_exists 'sass'; then
	p_info "SASS is not installed."
	sudo gem install sass
	if ! type_exists 'sass'; then
		p_fail "Something went wrong..."
	fi
else
	p_success "SASS is installed."
fi

# Check if Compass is already installed
if ! type_exists 'compass'; then
	p_info "Compass is not installed."
	sudo gem install compass
	if ! type_exists 'compass'; then
		p_fail "Something went wrong..."
	fi
else
	p_success "Compass is installed."
fi