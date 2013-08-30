#!/usr/bin/env bash

# Check if the gems listed in $RUBYGEMS are installed - If not, it will also install them.
for rubygem in $RUBYGEMS; do
	if ! type_exists $rubygem; then
		p_info "$rubygem is not installed."
		sudo gem install $rubygem
		if ! type_exists $rubygem; then
			p_fail "Something went wrong..."
		fi
	else
		p_success "$rubygem is installed."
	fi
done