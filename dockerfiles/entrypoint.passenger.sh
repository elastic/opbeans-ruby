#!/bin/bash
set -e

gem install bundler -v 2.0.2
bin/setup

/sbin/my_init
