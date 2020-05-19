#!/bin/sh

# If `bundle check` indicates it's needed, `bundle install` here rather than in Dockerfile,
#    so that we can cache its result in the bundle_cache container.
bundle check || bundle install

# Start Sidekiq.
bundle exec sidekiq -C config/sidekiq.yml.erb
