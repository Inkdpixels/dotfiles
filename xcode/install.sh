#!/usr/bin/env bash

# Check if the xCode Command Line Tools are already installed.
if ! type_exists 'gcc'; then
	p_fail "The XCode Command Line Tools must be installed first.
	 https://developer.apple.com/downloads"
	 open -a Safari https://developer.apple.com/downloads
else
	p_success "The XCode Command Line Tools are installed."
fi