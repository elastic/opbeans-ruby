#!/usr/bin/env bash
set -euxo pipefail

AGENT_VERSION="${1?Missing the APM ruby agent version}"

## Normalise the agent version that it's coming from the tag name.
NEW_AGENT_VERSION=$(echo ${AGENT_VERSION} | sed 's#^v##g')

## Gather ruby version
RUBY_VERSION=$(grep '^ruby' Gemfile | sed -E "s/.*[\"'](.+)[\"']/\1/")

## Use docker to bump the version to ensure the environment is easy to reproduce.
docker run --rm -t \
  --user $UID \
  -e LOCAL_USER_ID=$UID \
  -e HOME=/tmp \
  -e AGENT_VERSION="${NEW_AGENT_VERSION}" \
  -w /app \
  -v "$(pwd):/app" \
  ruby:${RUBY_VERSION} /bin/sh -c "set -x
    gem install bundler
    gem install elastic-apm -v ${AGENT_VERSION}
    bundle update elastic-apm"

# Validate whether the agent version matches
git diff --name-only -S"elastic-apm (${NEW_AGENT_VERSION})" | grep Gemfile.lock && found=1 || found=0
if [ ${found} -eq 0 ] ; then
  echo 'ERROR: Agent version was not updated. See the below diff detail output:'
  git diff --unified=0 Gemfile.lock
  exit 1
fi

# Commit changes
git add Gemfile.lock
git commit -m "fix(package): bump elastic-apm to version ${NEW_AGENT_VERSION}"
