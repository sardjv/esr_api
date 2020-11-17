#!/bin/sh

# Start Sidekiq.
bundle exec sidekiq -C config/sidekiq.yml.erb
