#!/usr/bin/env bash
set -euxo pipefail

AGENT_VERSION="${1?Missing the APM ruby agent version}"

bundle install
bundle update elastic-apm

# Validate whether the agent version matches
git diff --name-only -S"elastic-apm (${AGENT_VERSION})" | grep Gemfile.lock

# Commit changes
git add Gemfile.lock
git commit -m "Bump version ${AGENT_VERSION}"
