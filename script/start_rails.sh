#!/bin/sh

# Remove any existing server process in case of dirty shutdown, with -f in case the file doesn't exist.
rm -f /app/tmp/pids/server.pid

# If `bundle check` indicates it's needed, `bundle install` here rather than in Dockerfile,
#    so that we can cache its result in the bundle_cache container.
bundle check || bundle install

# Yarn install here instead of in Dockerfile since it needs to come after bundle install.
yarn check || yarn install

# Perform any database tasks needed.
bundle exec rails db:create db:migrate

# Start server.
bundle exec rails s
