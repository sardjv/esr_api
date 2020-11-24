#!/bin/sh

FIRST_RUN_FLAG_FILE=script/first_run_complete.tmp
if [ -f $FIRST_RUN_FLAG_FILE ]
then echo "$FIRST_RUN_FLAG_FILE detected, skipping webpacker library installation..."
else echo "Booting for the first time, installing webpacker libraries and creating database..."
  # Install here as well as in start_rails_development to prevent webpacker failing on initial boot.
  bundle install
  yarn install
fi

# Start Webpacker
./bin/webpack-dev-server
