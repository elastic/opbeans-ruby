[![Build Status](https://apm-ci.elastic.co/buildStatus/icon?job=apm-agent-ruby%2Fopbeans-ruby-mbp%2Fmaster)](https://apm-ci.elastic.co/job/apm-agent-ruby/job/opbeans-ruby-mbp/job/master/)

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Testing locally

The simplest way to test this demo is by running:

```bash
make test
```

Tests are written using [bats](https://github.com/sstephenson/bats) under the tests dir

## Publishing to dockerhub locally

Publish the docker image with

```bash
VERSION=1.2.3 make publish
```

NOTE: VERSION refers to the tag for the docker image which will be published in the registry
