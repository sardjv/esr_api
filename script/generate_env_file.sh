#!/bin/sh

# This script will copy .env.example into a new file .env, and replace
# each instance of the string YOU_MUST_CHANGE_THIS_PASSWORD with a random
# 64-character hex. For use on initial system setup only.
# Requires bash and openssl.
# To run:
# sh ./script/generate_env_file.sh
EXAMPLE_FILE=.env.example
ENV_FILE=.env
REPLACE=YOU_MUST_CHANGE_THIS_PASSWORD
if [ -f $ENV_FILE ]
then echo "$ENV_FILE detected, aborting."
else echo "Generating a fresh $ENV_FILE file..."
  cp $EXAMPLE_FILE $ENV_FILE

  for i in `grep $REPLACE $ENV_FILE`; do
    sed -i -e "1s/$REPLACE/$(openssl rand -hex 32)/;t" -e "1,/$REPLACE/s//$(openssl rand -hex 32)/" $ENV_FILE
  done

  echo "$ENV_FILE file generation complete."
fi
