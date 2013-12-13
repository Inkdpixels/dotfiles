#!/usr/bin/env bash


for package in $NODEPACKAGES; do
	npm install -g $package
done