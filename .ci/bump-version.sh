#!/usr/bin/env bash
set -euxo pipefail

AGENT_VERSION="${1?Missing the APM ruby agent version}"

## Use docker to bump the version to ensure the environment is easy to reproduce.
docker run --rm -t \
  --user $UID \
  -e LOCAL_USER_ID=$UID \
  -e HOME=/app \
  -w /app \
  -v "$(pwd):/app" \
  ruby:2.6 /bin/bash -c "set -x
    gem install bundler
    bundle install
    bundle update elastic-apm"

# Validate whether the agent version matches
git diff --name-only -S"elastic-apm (${AGENT_VERSION})" | grep Gemfile.lock

# Commit changes
git add Gemfile.lock
git commit -m "Bump version ${AGENT_VERSION}"
