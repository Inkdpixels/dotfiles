#!/usr/bin/env bash

DOT_DIR="$HOME/.dotfiles"
OUTPUT_DIR="$DOT_DIR/tests/output"

source $DOT_DIR/lib/utils/afterEach
source $DOT_DIR/lib/utils/beforeEach

#
# Tests for invalid arguments
#
testReturnCodeForInvalidCommand() {
	beforeEach

	dot invalid_argument > /dev/null
	assertEquals "The dot CLI should return a failure code if ran with an invalid argument." 1 $?

	afterEach
}

testReturnCodeWithoutArguments() {
	beforeEach

	dot > /dev/null
	returnCode=$?
	assertEquals "The dot CLI should return a failure code if ran without arguments." 1 $returnCode

	afterEach
}

#
# Tests for the 'help' command.
#
testOutputForHelpCommand() {
	beforeEach

	dot help > "$OUTPUT_DIR/help.result.txt"

	diff "$OUTPUT_DIR/help.result.txt" "$OUTPUT_DIR/help.txt"
	assertEquals "The dot CLI should output a instructional guide if ran with the 'help' argument." 0 $?

	afterEach
}

testReturnCodeForHelpCommand() {
	beforeEach

	dot help > /dev/null
	returnCode=$?
	assertEquals "The dot CLI should return a success code if ran with the 'help' argument." 0 $returnCode

	afterEach
}

#
# Run all tests.
#
. shunit2
