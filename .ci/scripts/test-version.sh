#!/usr/bin/env bash

# This script checks the difference of the input and the version of elastic-apm in Gemfile.lock
# If the input and the version in the Gemfile.lock file are equal the script returns a non zero exit code.
# If the input and the version in the Gemfile.lock file differ the script return a 0 exit code.
#
# This is used for an updatecli condition to determine if the pipeline should continue or not.

set -euo pipefail

version=$(grep elastic-apm Gemfile.lock | head -1 | awk -F'[()]' '{ print $2 }')

test "$version" != "$1"
