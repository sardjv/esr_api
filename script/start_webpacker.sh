#!/bin/sh

# `bundle install` here rather than in Dockerfile,
# so that we can cache its result in the bundle_cache container.
bundle install

yarn install

# Start Webpacker
./bin/webpack-dev-server
