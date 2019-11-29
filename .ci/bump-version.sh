#!/usr/bin/env bash
set -euxo pipefail

AGENT_VERSION="${1?Missing the APM ruby agent version}"

## Gather ruby version
RUBY_VERSION=$(grep '^ruby' Gemfile | sed -E "s/.*[\"'](.+)[\"']/\1/")

## Use docker to bump the version to ensure the environment is easy to reproduce.
docker run --rm -t \
  --user $UID \
  -e LOCAL_USER_ID=$UID \
  -e HOME=/tmp \
  -w /app \
  -v "$(pwd):/app" \
  ruby:${RUBY_VERSION} /bin/sh -c "set -x
    gem install bundler
    bundle update elastic-apm"

# Validate whether the agent version matches
git diff --name-only -S"elastic-apm (${AGENT_VERSION})" | grep Gemfile.lock

# Commit changes
git add Gemfile.lock
git commit -m "fix(package): bump elastic-apm to version ${AGENT_VERSION}"
