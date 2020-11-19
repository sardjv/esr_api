FROM ruby:2.7.2-alpine

RUN apk update
RUN apk add build-base git nodejs yarn

# MySQL option.
RUN apk add mysql-dev

RUN mkdir /app

# Safer not to run as root, since the user has full access to the host.
# Syntax: https://stackoverflow.com/a/49955098/4741698
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

WORKDIR /app

ENV BUNDLE_PATH /bundle_cache

COPY package.json yarn.lock ./

COPY . .

CMD puma -C config/puma.rb
