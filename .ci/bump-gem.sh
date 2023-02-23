#!/usr/bin/env bash
set -euxo pipefail

# Update elastic-apm in Gemfile
sed -ibck "s#\(gem 'elastic-apm', \)\('.*'\)\(.*\)#\1'${1}'\3#g" Gemfile

RUBY_VERSION=$(grep '^ruby' Gemfile | awk '{ print $2 }' | tr -d \')
## Use docker to bump the version to ensure the environment is easy to reproduce.
docker run --rm -t \
  --user $UID \
  -e LOCAL_USER_ID=$UID \
  -e HOME=/tmp \
  -e AGENT_VERSION="${NEW_AGENT_VERSION}" \
  -w /app \
  -v "$(pwd):/app" \
  "ruby:${RUBY_VERSION}" /bin/sh -c "set -x
    # This version is fixed in the Gemfile.lock
    gem install bundler -v 2.2.22
    bundle update elastic-apm"
