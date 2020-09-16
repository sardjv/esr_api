#!/bin/sh

# Remove any existing server process in case of dirty shutdown, with -f in case the file doesn't exist.
rm -f /app/tmp/pids/server.pid

# Start server.
bundle exec rails s
